const prisma = require("../utils/Prisma");

const getOnlineParticipants = async (grupid) => {
  return await prisma.perserta_Grup.findMany({
    where: {
      grupid,
      online: "1",
    },
    include: {
      user: true,
    },
  });
};

module.exports = { getOnlineParticipants };
