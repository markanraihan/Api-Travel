// PerjalananRepository.js
const prisma = require("../../utils/Prisma");

const getPerjalananByName = async (nama_perjalanan) => {
  return await prisma.perjalanan.findFirst({
    where: {
      nama_perjalanan,
    },
  });
};

const getPerjalanan = async () => {
  return await prisma.perjalanan.findMany({
    orderBy: {
      sort_order: "asc", // Urutkan berdasarkan kolom sort_order secara ascending
    },
  });
};

const createPerjalanan = async (nama_perjalanan) => {
  return await prisma.perjalanan.create({
    data: {
      nama_perjalanan,
    },
  });
};

module.exports = {
  getPerjalananByName,
  createPerjalanan,
  getPerjalanan,
};
