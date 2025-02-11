// ProgressDoaRepository.js
const prisma = require("../../utils/Prisma");

const ProgressDoaRepository = {
  async createProgressDoa(data) {
    return await prisma.progress_Doa.create({ data });
  },

  async updateProgressDoa(progress_doaid, data) {
    // Cek apakah progress_doa sudah selesai
    const existingProgressDoa = await prisma.progress_Doa.findUnique({
      where: { progress_doaid },
    });

    if (!existingProgressDoa) {
      throw new Error("Progress doa tidak ditemukan.");
    }

    if (existingProgressDoa.cek_doa) {
      throw new Error("Progress doa sudah selesai dan tidak dapat diperbarui lagi.");
    }

    // Set waktu selesai
    const doaSelesai = new Date();
    const doaMulai = new Date(existingProgressDoa.doa_mulai);
    const totalSeconds = Math.floor((doaSelesai - doaMulai) / 1000);

    // Konversi durasi ke format MM:SS
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;
    const formattedDuration = `${minutes}:${seconds.toString().padStart(2, "0")}`;

    return await prisma.progress_Doa.update({
      where: { progress_doaid },
      data: {
        doa_selesai: doaSelesai,
        durasi_doa: formattedDuration,
        cek_doa: true,
      },
    });
  },

  async getProgressDoaById(progress_doaid) {
    return await prisma.progress_Doa.findUnique({
      where: { progress_doaid },
    });
  },

  async getAllProgressDoa() {
    return await prisma.progress_Doa.findMany();
  },
};

module.exports = ProgressDoaRepository;