// DoaController.js
const DoaService = require("../../services/Doa/DoaService");

const getAllDoa = async (req, res) => {
  try {
    const doaList = await DoaService.getAllDoa();
    res.status(200).json(doaList);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const getDoaById = async (req, res) => {
  try {
    const doaId = req.params.id;
    if (!doaId) {
      return res.status(400).json({ message: "ID is required" });
    }

    const doa = await DoaService.getDoaById(doaId);

    if (!doa) {
      return res.status(404).json({ message: "Doa not found" });
    }

    const { perjalanan, ...doaWithoutPerjalanan } = doa;
    res.status(200).json(doaWithoutPerjalanan);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const createDoa = async (req, res) => {
  try {
    const { judul_doa, perjalananid, link_audio, ayat } = req.body;
    const newDoa = await DoaService.createDoa({ judul_doa, perjalananid, link_audio, ayat });
    res.status(201).json(newDoa);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const updateDoa = async (req, res) => {
  try {
    const doaId = req.params.id;
    const { judul_doa, link_audio, ayat } = req.body; 
    const updatedDoa = await DoaService.updateDoa(doaId, { judul_doa, link_audio, ayat });
    res.status(200).json(updatedDoa);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const deleteDoa = async (req, res) => {
  try {
    const doaId = req.params.id;
    await DoaService.deleteDoa(doaId);
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getAllDoa,
  getDoaById,
  createDoa,
  updateDoa,
  deleteDoa,
};