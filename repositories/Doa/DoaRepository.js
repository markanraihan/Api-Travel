// DoaRepository.js
const prisma = require("../../utils/Prisma");

const getAllDoa = async () => {
  return await prisma.doa.findMany({
    include: {
      ayat: true,
    },
  });
};

const getDoaById = async (doaId) => {
  return await prisma.doa.findUnique({
    where: { doaid: doaId }, 
    include: {
      ayat: true,
    },
  });
};

const getDoaByPerjalananId = async (perjalananId) => {
  return await prisma.doa.findMany({
    where: { perjalananid: perjalananId },
    include: {
      ayat: true,
    },
  });
};

const createDoa = async ({ judul_doa, perjalananid, link_audio, ayat }) => {
  return await prisma.doa.create({
    data: {
      judul_doa,
      perjalananid,
      link_audio,
      ayat: {
        create: ayat, 
      },
    },
    include: {
      ayat: true,
    },
  });
};

const updateDoa = async (doaId, { judul_doa, link_audio, ayat }) => {
  console.log("Updating Doa with ID:", doaId);
  console.log("Payload:", { judul_doa, link_audio, ayat });

  const existingDoa = await prisma.doa.findUnique({
    where: { doaid: doaId },
  });

  if (!existingDoa) {
    throw new Error("Doa not found");
  }

  return await prisma.doa.update({
    where: { doaid: doaId },
    data: {
      judul_doa,
      link_audio, // Ensure this field is included
      ayat: {
        create: ayat,
      },
    },
    include: {
      ayat: true,
    },
  });
};

const deleteDoa = async (doaId) => {
  return await prisma.doa.delete({
    where: { doaid: doaId },
  });
};

module.exports = {
  getAllDoa,
  getDoaById,
  getDoaByPerjalananId,
  createDoa,
  updateDoa,
  deleteDoa,
};