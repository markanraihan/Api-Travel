// VideoService.js
const videoRepository = require('../../repositories/Video/VideoRepository');

class VideoService {
  async getAllVideos() {
    return await videoRepository.findAll();
  }

  async getVideoById(videoid) {
    return await videoRepository.findById(videoid);
  }

  async createVideo(data) {
    return await videoRepository.create(data);
  }

  async updateVideo(videoid, data) {
    return await videoRepository.update(videoid, data);
  }

  async deleteVideo(videoid) {
    return await videoRepository.delete(videoid);
  }
}

module.exports = new VideoService();