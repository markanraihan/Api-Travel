const prisma = require("../utils/Prisma");
const HMS = require("@100mslive/server-sdk");
const dotenv = require("dotenv");
dotenv.config();
const hms = new HMS.SDK();

// Fungsi generateToken untuk membuat token acak

module.exports = async (req, res, next) => {
  const { grupid } = req.body;

  const grup = await prisma.grup.findUnique({
    where: { grupid },
    include: { room: true },
  });

  if (!grup) {
    return res.status(404).json({ msg: "Grup tidak ditemukan" });
  }

  let availableRoom = null;
  for (const room of grup.room) {
    const participantsCount = await prisma.peserta_Grup.count({
      where: { grupid: grupid, roomid: room.roomid },
    });

    if (participantsCount < room.capacity) {
      availableRoom = room;
      break;
    }
  }

  if (!availableRoom) {
    availableRoom = await prisma.room.create({
      data: {
        nama_room: `Room ${grup.room.length + 1}`,
        grupid: grupid,
        token_speaker: hms.auth.getAuthToken(),
        token_listener: hms.auth.getAuthToken(),
        token_moderator: hms.auth.getAuthToken(),
        capacity: 20,
      },
    });
  }

  req.room = availableRoom;
  next();
};
