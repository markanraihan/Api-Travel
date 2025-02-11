// PerjalananController.js
const PerjalananServices = require("../../services/Perjalanan/PerjalananServices");

const createPerjalanan = async (req, res) => {
  const { nama_perjalanan } = req.body;

  try {
    const result = await PerjalananServices.createPerjalanan(nama_perjalanan);
    res.status(200).json({ msg: "Perjalanan berhasil dibuat", data: result });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

const getPerjalanan = async (req, res) => {
  try {
    const result = await PerjalananServices.getPerjalanan();
    res.status(200).json({ msg: "Perjalanan berhasil ditemukan", data: result });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};
module.exports = {
  createPerjalanan,
  getPerjalanan,
};
