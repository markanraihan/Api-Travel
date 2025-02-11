// PerjalananService.js
const PerjalananRepository = require("../../repositories/Perjalanan/PerjalananRepository");

const createPerjalanan = async (nama_perjalanan) => {
  if (!nama_perjalanan) {
    throw new Error("Perjalanan harus diisi !");
  }

  const existingPerjalanan = await PerjalananRepository.getPerjalananByName(nama_perjalanan);
  if (existingPerjalanan) {
    throw new Error("Perjalanan sudah ada !");
  }

  const perjalanan = await PerjalananRepository.createPerjalanan(nama_perjalanan);
  return perjalanan;
};

const getPerjalanan = async () => {
  const perjalanan = await PerjalananRepository.getPerjalanan();
  return perjalanan;
};

module.exports = {
  createPerjalanan,
  getPerjalanan,
};
