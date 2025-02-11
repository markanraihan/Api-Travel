// index.js
const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const path = require("path");
const authRoutes = require("./routes/authRoutes");
const ProtectedRoutes = require("./routes/ProtectedRoutes");
const prisma = require("./utils/Prisma");
const router = express.Router();
const Profileroutes = require("./routes/ProfileRoutes");
const Gruproutes = require("./routes/GrupRoutes");
const AudioRoutes = require("./routes/AudioRoutes");
const ProgressRoutes = require("./routes/ProgressRoutes")
const setStatus = require("./routes/setStatusRoutes");
const PerjalananRoutes = require("./routes/Perjalanan");
const DoaRoutes = require("./routes/DoaRoutes");
const ProgressDoaRoutes = require("./routes/ProgressDoaRoutes");
const VideoRoutes = require('./routes/VideoRoutes');

dotenv.config();

const app = express();

// Izin Corss
app.use(cors()); // Izin Cors

// Init Middleware
app.use(express.json({ extended: false }));

// Definisi Route
app.use("/api/auth", authRoutes);
app.use("/api/protected", ProtectedRoutes);
app.use("/api/profile", Profileroutes);
app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.use("/api/Group", Gruproutes);
app.use("/api/Audio", AudioRoutes);
app.use("/api/progress", ProgressRoutes); 
app.use("/api/setStatus", setStatus);
app.use("/api/Perjalanan", PerjalananRoutes);
app.use("/api/Doa", DoaRoutes); // Masukin data doa untuk admin
app.use('/api/Videos', VideoRoutes);
app.use("/api/progressDoa", ProgressDoaRoutes); // Simpan ke progress_doaid

const PORT = process.env.PORT || 5000;

// Tambahkan koneksi Prisma ORM di sini jika diperlukan

app.listen(PORT, async () => {
  try {
    await prisma.$connect(); // Hubungkan ke database Prisma
    console.log(`Server berjalan pada http://localhost:${PORT}`);
    router.get("/", (req, res) => {
      res.send({ status: "success", msg: `Server berjalan pada ${process.env.NODE_ENV}` });
    });
  } catch (error) {
    console.error("Koneksi ke database gagal:", error);
  }
});

module.exports = app;
