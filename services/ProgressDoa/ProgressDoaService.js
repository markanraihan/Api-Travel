// ProgressDoaService.js
const ProgressDoaRepository = require("../../repositories/ProgressDoa/ProgressDoaRepository");

const ProgressDoaService = {
  async createProgressDoa(data) {
    return await ProgressDoaRepository.createProgressDoa(data);
  },

  async updateProgressDoa(progress_doaid, data) {
    return await ProgressDoaRepository.updateProgressDoa(progress_doaid, data);
  },

  async getProgressDoaById(progress_doaid) {
    return await ProgressDoaRepository.getProgressDoaById(progress_doaid);
  },

  async getAllProgressDoa() {
    return await ProgressDoaRepository.getAllProgressDoa();
  },
};

module.exports = ProgressDoaService;