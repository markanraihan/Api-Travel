// ProgressServices.js
const ProgressRepository = require("../../repositories/Progress/ProgressRepository");

const createProgress = async (grupid, perjalananid) => {
  // Validasi grup
  const grup = await ProgressRepository.findGrupById(grupid);
  if (!grup) {
    return { status: 404, data: { msg: "Grup tidak ditemukan" } };
  }

  // Validasi perjalanan
  const perjalanan = await ProgressRepository.findPerjalananById(perjalananid);
  if (!perjalanan) {
    return { status: 404, data: { msg: "Perjalanan tidak ditemukan" } };
  }

  // Cek peserta online
  const onlineParticipants = await ProgressRepository.findOnlineParticipants(grupid);
  if (onlineParticipants.length === 0) {
    return { status: 404, data: { msg: "Tidak ada peserta online dalam grup ini" } };
  }

  // Mulai transaksi
  try {
    const result = await ProgressRepository.createProgressTransaction(grupid, perjalanan.nama_perjalanan, perjalananid, onlineParticipants);

    return { status: 200, data: result };
  } catch (err) {
    console.error("Error in createProgress Service:", err.message);
    throw new Error(err.message);
  }
};

const exitProgress = async (progressid) => {
  const progress = await ProgressRepository.getValidationProgress(progressid);
  if (!progress) {
    throw new Error("Progress tidak ditemukan.");
  }
  if (progress.live === 0) {
    throw new Error("Progress sudah dihentikan sebelumnya.");
  }

  return await ProgressRepository.exitProgress(progressid);
};

const getLiveProgress = async () => {
  return await ProgressRepository.getLiveProgress();
};

module.exports = {
  createProgress,
  getLiveProgress,
  exitProgress,
};
