// ProgressRepository.js
const prisma = require("../../utils/Prisma");

const findGrupById = async (grupid) => {
  return prisma.grup.findUnique({ where: { grupid } });
};

const findPerjalananById = async (perjalananid) => {
  return prisma.perjalanan.findUnique({ where: { perjalananid } });
};

const findOnlineParticipants = async (grupid) => {
  return prisma.peserta_Grup.findMany({
    where: {
      grupid,
      online: "1",
    },
  });
};

const createProgressTransaction = async (grupid, jenis_perjalanan, perjalananid, participants) => {
  return prisma.$transaction(async (prisma) => {
    const waktuMulai = new Date(); // Ambil waktu sekarang

    // Cek apakah progress sudah ada
    const existingProgress = await prisma.progress.findFirst({
      where: {
        grupid,
        jenis_perjalanan,
      },
    });

    if (existingProgress && existingProgress.is_finished === true) {
      throw new Error("Progress ini sudah dihentikan sebelumnya dan tidak dapat diaktifkan lagi.");
    }

    if (existingProgress) {
      if (existingProgress.live === 1) {
        throw new Error("Progress sudah aktif, tidak bisa diaktifkan lagi.");
      }

      // Jika progress ada tapi belum selesai, update live jadi 1
      const updatedProgress = await prisma.progress.update({
        where: { progressid: existingProgress.progressid },
        data: { live: 1, waktu_mulai: waktuMulai }, // Tambahkan waktu_mulai
      });

      return {
        msg: "Progress diperbarui ke status live",
        data: updatedProgress,
      };
    }

    // Buat progress baru
    const newProgress = await prisma.progress.create({
      data: {
        grupid,
        jenis_perjalanan,
        live: 1,
        status: true,
        is_finished: false,
        waktu_mulai: waktuMulai, // Tambahkan waktu_mulai
      },
    });

    // Pastikan ada peserta online
    if (participants.length === 0) {
      throw new Error("Tidak ada peserta yang online.");
    }

    // Insert peserta ke progress_perjalanan
    await prisma.progress_perjalanan.create({
      data: {
        progress_perjalananid: crypto.randomUUID(),
        progressid: newProgress.progressid,
        perjalananid: perjalananid,
        waktu_mulai: waktuMulai,
        time_selesai: null,
      }
    });    

    return {
      msg: "Progress berhasil dibuat dan peserta ditambahkan",
      data: newProgress,
    };
  });
};

const exitProgress = async (progressid) => {
  return prisma.$transaction(async (prisma) => {
    // Ambil data progress yang sedang dihentikan
    const progress = await prisma.progress.findUnique({
      where: { progressid },
      include: { grup: true }, 
    });

    if (!progress) {
      throw new Error("Progress tidak ditemukan.");
    }

    if (progress.live === 0) {
      throw new Error("Progress sudah dihentikan sebelumnya.");
    }

    const timeNow = new Date();

    // Ambil ID perjalanan yang sesuai dengan progress ini
    const perjalanan = await prisma.perjalanan.findFirst({
      where: { nama_perjalanan: progress.jenis_perjalanan },
    });

    if (!perjalanan) {
      throw new Error("Perjalanan terkait tidak ditemukan.");
    }

    // Ambil peserta dalam grup ini
    const participants = await prisma.peserta_Grup.findMany({
      where: { grupid: progress.grupid },
      select: { userId: true }, // Hanya ambil userId
    });

    if (participants.length === 0) {
      throw new Error("Tidak ada peserta dalam grup ini.");
    }

    // Gunakan waktu_mulai dari progress
    const waktuMulai = progress.waktu_mulai || new Date(); // Pastikan ada nilai

    // Buat progress_perjalanan baru untuk setiap peserta
    const progressPerjalananData = participants.map((participant) => ({
      progress_perjalananid: crypto.randomUUID(),
      progressid,
      userId: participant.userId,
      perjalananid: perjalanan.perjalananid, 
      waktu_mulai: waktuMulai, 
      time_selesai: timeNow,
    }));

    await prisma.progress_perjalanan.createMany({
      data: progressPerjalananData,
    });

    // Update progress untuk menandai sesi selesai
    await prisma.progress.update({
      where: { progressid },
      data: { live: 0, is_finished: true },
    });

    return {
      msg: "Progress berhasil dihentikan dan perjalanan dicatat.",
      time_selesai: timeNow,
    };
  });
};

const getValidationProgress = async (progressid) => {
  return await prisma.progress.findUnique({
    where: { progressid },
    include: {
      progressDetails: true,
    },
  });
};

const getLiveProgress = async () => {
  return await prisma.progress.findMany({
    where: {
      live: 1,
      status: true,
    },
    select: {
      progressid: true,
      grupid: true,
      jenis_perjalanan: true,
      live: true,
      status: true,
      is_finished: true, // Tambahkan is_finished ke response
    },
  });
};

const updateProgressLiveStatus = async (progressid, live) => {
  return await prisma.progress.update({
    where: { progressid },
    data: { live: 0 },
  });
};

const updateProgressTimeSelesai = async (progressid, timeNow) => {
  return await prisma.progress_perjalanan.updateMany({
    where: { progressid },
    data: { time_selesai: timeNow },
  });
};

module.exports = {
  findGrupById,
  findPerjalananById,
  findOnlineParticipants,
  getLiveProgress,
  exitProgress,
  getValidationProgress,
  updateProgressLiveStatus,
  updateProgressTimeSelesai,
  createProgressTransaction,
};