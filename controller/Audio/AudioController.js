const HMS = require("@100mslive/server-sdk");
const prisma = require("../../utils/Prisma");
const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
const axios = require("axios");
const { v4: uuidv4 } = require("uuid");

// Load environment variables
dotenv.config();

// Inisialisasi HMS SDK dengan akses key dan secret key dari .env
const hms = new HMS.SDK({
  accessKey: process.env.HMS_ACCESS_KEY,
  secret: process.env.HMS_SECRET,
});

const AudioController = {
  createRoom: async (req, res) => {
    try {
      const { token } = req.headers;
      const { nama_room } = req.body; // Ambil nama room dari request body

      // Verifikasi JWT token pengguna
      const responseJWT = jwt.verify(token, process.env.JWT_SECRET);
      const userId = responseJWT.user.id;

      // Verifikasi data user
      const user = await prisma.users.findUnique({
        where: { id: userId },
        select: { role: true },
      });

      if (!user) {
        return res.status(404).json({ msg: "User not found" });
      }

      // Gunakan nama room dari request body, jika tidak ada gunakan nama default
      const roomName = nama_room || `Room ${new Date().toISOString()}`;

      // Create room in 100ms Live
      const createRoomResponse = await axios.post(
        "https://api.100ms.live/v2/rooms",
        {
          name: roomName,
          template_id: process.env.HMS_TEMPLATE_ID, // Ganti dengan template ID jika ada
        },
        {
          headers: {
            Authorization: `Bearer ${process.env.HMS_API_KEY}`,
          },
        }
      );

      if (!createRoomResponse.data || !createRoomResponse.data.id) {
        return res.status(500).json({
          msg: "Failed to create room in 100ms",
          error: createRoomResponse.data,
        });
      }

      const roomId = createRoomResponse.data.id;
      const roomData = {
        nama_room: roomName,
        token_speaker: "",
        token_listener: "",
      };

      // Generate token sesuai dengan standar 100ms
      const iat = Math.floor(Date.now() / 1000); // Waktu sekarang (dalam detik)
      const exp = iat + 24 * 60 * 60; // Token berlaku 24 jam
      const nbf = iat;

      // Token untuk speaker (jika user.role adalah ustadz)
      if (user.role === "ustadz") {
        const speakerPayload = {
          version: 2,
          type: "app",
          app_data: null,
          access_key: process.env.HMS_ACCESS_KEY,
          role: "speaker", // PERBAIKAN tambah deklarasi rolenya
          room_id: roomId, // PERBAIKAN room_Id jadi roomId
          user_id: userId,
          exp: Math.floor(Date.now() / 1000) + 24 * 60 * 60, // Validitas 24 jam
          iat: Math.floor(Date.now() / 1000),
          nbf: Math.floor(Date.now() / 1000),
          iss: process.env.HMS_ACCESS_ISS, // Sesuai dengan `access_key`
          sub: "api",
          jti: uuidv4(), // Menghasilkan UUID untuk `jti`
        };

        roomData.token_speaker = jwt.sign(speakerPayload, process.env.HMS_SECRET);
      }

      // Token untuk listener
      const listenerPayload = {
        version: 2,
        type: "app",
        app_data: null,
        access_key: process.env.HMS_ACCESS_KEY,
        role: "listener", // PERBAIKAN tambah deklarasi rolenya
        room_id: roomId, // PERBAIKAN room_Id jadi roomId
        user_id: userId,
        exp: Math.floor(Date.now() / 1000) + 24 * 60 * 60, // Validitas 24 jam
        iat: Math.floor(Date.now() / 1000),
        nbf: Math.floor(Date.now() / 1000),
        iss: process.env.HMS_ACCESS_ISS, // Sesuai dengan `access_key`
        sub: "api",
        jti: uuidv4(), // Menghasilkan UUID untuk `jti`
      };

      roomData.token_listener = jwt.sign(listenerPayload, process.env.HMS_SECRET);

      // Simpan room ke database
      roomData.id = roomId;

      const newRoom = await prisma.room.create({
        data: roomData,
      });

      return res.json({
        status: "success",
        message: "Room created successfully",
        room: newRoom,
      });
    } catch (err) {
      console.error("Error creating room:", err);
      return res.status(500).json({ msg: "Internal server error", error: err.message });
    }
  },

  getRoom: async (req, res) => {
    const { token } = req.headers;

    try {
      const responseJWT = jwt.verify(token, process.env.JWT_SECRET);
      const userId = responseJWT.user.id;

      const getAllrooms = await prisma.room.findMany({
        select: {
          id: true,
          nama_room: true,
          token_speaker: true,
          token_listener: true,
        },
      });

      return res.json({ getAllrooms });
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ message: "Terjadi kesalahan di server" });
    }
  },

  getRoomByid: async (req, res) => {
    const { token } = req.headers;
    const { room_Id } = req.body;

    try {
      const responseJWT = jwt.verify(token, process.env.JWT_SECRET);
      const userId = responseJWT.user.id;
      const getRoomByid = await prisma.room.findUnique({
        where: { id: room_Id },
        select: {
          id: true,
          nama_room: true,
          token_speaker: true,
          token_listener: true,
        },
      });
      return res.json({
        status: "success",
        message: "Room found successfully",
        room: getRoomByid,
      });
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ message: "Terjadi kesalahan di server" });
    }
  },
  refreshRoomToken: async (req, res) => {
    try {
      const { token } = req.headers;
      const { room_Id } = req.body;

      // Verifikasi JWT token pengguna
      const responseJWT = jwt.verify(token, process.env.JWT_SECRET);
      const userId = responseJWT.user.id;

      // Verifikasi data user
      const user = await prisma.users.findUnique({
        where: { id: userId },
        select: { role: true },
      });

      if (!user) {
        return res.status(404).json({ msg: "User not found" });
      }

      // Cek keberadaan room di database
      const room = await prisma.room.findUnique({
        where: { id: room_Id },
      });

      if (!room) {
        return res.status(404).json({ msg: "Room not found" });
      }

      // Waktu saat ini (dalam detik)
      const iat = Math.floor(Date.now() / 1000);
      const exp = iat + 24 * 60 * 60; // Token berlaku 24 jam
      const nbf = iat;

      const basePayload = {
        version: 2,
        type: "app",
        app_data: null,
        access_key: process.env.HMS_ACCESS_KEY,
        room_id: room_Id,
        user_id: userId,
        exp: Math.floor(Date.now() / 1000) + 24 * 60 * 60, // Validitas 24 jam
        iat: Math.floor(Date.now() / 1000),
        nbf: Math.floor(Date.now() / 1000),
        iss: process.env.HMS_ACCESS_ISS, // Sesuai dengan `access_key`
        sub: "api",
        jti: uuidv4(), // Menghasilkan UUID untuk `jti`
      };

      let updatedData = {};

      if (user.role === "ustadz") {
        updatedData.token_speaker = jwt.sign({ ...basePayload, role: "speaker" }, process.env.HMS_SECRET, {
          algorithm: "HS256",
        });
      } else {
        updatedData.token_listener = jwt.sign({ ...basePayload, role: "listener" }, process.env.HMS_SECRET, {
          algorithm: "HS256",
        });
      }

      const updatedRoom = await prisma.room.update({
        where: { id: room_Id },
        data: updatedData,
      });

      return res.json({
        status: "success",
        message: "Token refreshed successfully",
        room: updatedRoom,
      });
    } catch (err) {
      console.error("Error refreshing token:", err);
      return res.status(500).json({ msg: "Internal server error", error: err.message });
    }
  },

  assignRoomToGroup: async (req, res) => {
    try {
      const { roomid, grupid } = req.body;

      // Cek memastikan grup dan room ada
      const grup = await prisma.grup.findUnique({
        where: { grupid },
      });

      const room = await prisma.room.findUnique({
        where: { id: roomid },
      });
      if (!grup || !room) {
        return res.status(404).json({ msg: "Grup atau room tidak ditemukan" });
      }
      //update grup dengan roomid
      await prisma.grup.update({
        where: { grupid },
        data: {
          roomid: roomid,
        },
      });

      return res.json({
        status: "success",
        message: "Room Assigned to Group Successfully",
      });
    } catch (err) {
      console.error("Error assigning room to group:", err);
      return res.status(500).json({ msg: "Internal server error", error: err.message });
    }
  },
};

module.exports = AudioController;
