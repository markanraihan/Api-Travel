// VideoController.js
const videoService = require('../../services/Video/VideoService');

class VideoController {
  async getAllVideos(req, res) {
    try {
      const videos = await videoService.getAllVideos();
      res.json(videos);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async getVideoById(req, res) {
    try {
      const video = await videoService.getVideoById(req.params.videoid);
      if (!video) {
        return res.status(404).json({ message: 'Video not found' });
      }
      res.json(video);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async createVideo(req, res) {
    try {
      const newVideo = await videoService.createVideo(req.body);
      res.status(201).json(newVideo);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async updateVideo(req, res) {
    try {
      const updatedVideo = await videoService.updateVideo(req.params.videoid, req.body);
      res.json(updatedVideo);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async deleteVideo(req, res) {
    try {
      await videoService.deleteVideo(req.params.videoid);
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

module.exports = new VideoController();