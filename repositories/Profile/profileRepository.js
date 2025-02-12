// profileRepository.js
const prisma = require("../../utils/Prisma");

const findAllUsers = async () => {
  return prisma.users.findMany({
    select: {
      id: true,
      name: true,
      email: true,
      whatsapp: true,
      role: true,
      profile: {
        select: {
          photo: true,
        },
      },
    },
  });
};

const findUserById = async (userId) => {
  return prisma.users.findUnique({
    where: { id: userId },
    select: {
      id: true,
      name: true,
      email: true,
      whatsapp: true, 
      role: true,
      status_login: true,
      lastLogin: true,
      profile: {
        select: {
          photo: true,
        },
      },
    },
  });
};

const findProfileByUserId = async (userId) => {
  return prisma.profiles.findUnique({
    where: { userId },
  });
};

const updateProfile = async (userId, { name, whatsapp, photo }) => {
  return prisma.profiles.update({
    where: { userId },
    data: { name, whatsapp, photo },
  });
};

const updateUser = async (userId, { name, whatsapp }) => {
  return prisma.users.update({
    where: { id: userId },
    data: { name, whatsapp },
  });
};

const createProfile = async (userId, { name, whatsapp, photo }) => {
  return prisma.profiles.create({
    data: {
      userId,
      name,
      whatsapp,
      photo,
    },
  });
};

module.exports = {
  findAllUsers,
  findUserById,
  findProfileByUserId,
  updateProfile,
  updateUser,
  createProfile,
};
