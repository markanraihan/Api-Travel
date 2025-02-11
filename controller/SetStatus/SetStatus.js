const prisma = require("../../utils/Prisma");
const { validationResult } = require("express-validator");
const jwt = require("jsonwebtoken");

const statusController = {
  setStatusOnline: async (req, res) => {
    const { grupid, userId } = req.body;
    try {
      const { token } = req.headers;
      const responseJWT = jwt.verify(token, process.env.JWT_SECRET);

      const user = await prisma.users.findUnique({
        where: { id: responseJWT.user.id },
        select: { name: true, role: true },
      });

      if (!user) {
        return res.status(404).json({ msg: "User not found" });
      }

      const peserta = await prisma.peserta_Grup.findFirst({
        where: {
          grupid,
          userId,
        },
      });

      await prisma.peserta_Grup.update({
        where: {
          peserta_grupid: peserta.peserta_grupid,
        },
        data: {
          online: "1",
        },
      });
      return res.status(200).json({
        status: true,
        message: "User online",
      });
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
  setStatusOffline: async (req, res) => {
    const { grupid, userId } = req.body;
    try {
      const token = req.headers.token;
      const responseJWT = jwt.verify(token, process.env.JWT_SECRET);

      const user = await prisma.users.findUnique({
        where: { id: responseJWT.user.id },
        select: { name: true, role: true },
      });

      if (!user) {
        return res.status(404).json({ msg: "User not found" });
      }
      const peserta = await prisma.peserta_Grup.findFirst({
        where: {
          grupid,
          userId,
        },
      });

      if (!peserta) {
        return res.status(404).json({
          status: false,
          msg: "Peserta not found",
        });
      }

      await prisma.peserta_Grup.update({
        where: {
          peserta_grupid: peserta.peserta_grupid,
        },
        data: {
          online: "0",
        },
      });
      return res.status(200).json({
        status: true,
        message: "User offline",
      });
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
};
module.exports = statusController;
