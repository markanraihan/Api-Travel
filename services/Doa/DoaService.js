// DoaService.js
const DoaRepository = require("../../repositories/Doa/DoaRepository");

const getAllDoa = async () => {
  return await DoaRepository.getAllDoa();
};

const getDoaById = async (doaId) => {
  if (!doaId) {
    throw new Error("doaId is required");
  }

  return await DoaRepository.getDoaById(doaId);
};

const getDoaByPerjalananId = async (perjalananId) => {
  if (!perjalananId) {
    throw new Error("perjalananId is required");
  }

  return await DoaRepository.getDoaByPerjalananId(perjalananId);
};

const createDoa = async ({ judul_doa, perjalananid, link_audio, ayat }) => {
  return await DoaRepository.createDoa({ judul_doa, perjalananid, link_audio, ayat });
};

const updateDoa = async (doaId, { judul_doa, link_audio, ayat }) => {
  return await DoaRepository.updateDoa(doaId, { judul_doa, link_audio, ayat });
};

const deleteDoa = async (doaId) => {
  return await DoaRepository.deleteDoa(doaId);
};

module.exports = {
  getAllDoa,
  getDoaById,
  getDoaByPerjalananId,
  createDoa,
  updateDoa,
  deleteDoa,
};