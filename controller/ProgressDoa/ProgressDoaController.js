// ProgressDoaController.js
const ProgressDoaService = require("../../services/ProgressDoa/ProgressDoaService");

const ProgressDoaController = {
  async createProgressDoa(req, res) {
    try {
      const data = req.body;
      const progressDoa = await ProgressDoaService.createProgressDoa(data);
      res.status(201).json(progressDoa);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async updateProgressDoa(req, res) {
    try {
      const { progress_doaid } = req.params;
      const data = req.body;
      const updatedProgressDoa = await ProgressDoaService.updateProgressDoa(progress_doaid, data);
      res.status(200).json(updatedProgressDoa);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getProgressDoaById(req, res) {
    try {
      const { progress_doaid } = req.params;
      const progressDoa = await ProgressDoaService.getProgressDoaById(progress_doaid);
      res.status(200).json(progressDoa);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },

  async getAllProgressDoa(req, res) {
    try {
      const progressDoaList = await ProgressDoaService.getAllProgressDoa();
      res.status(200).json(progressDoaList);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },
};

module.exports = ProgressDoaController;