// VideoRoutes.js
const express = require('express');
const videoController = require('../controller/Video/VideoController');

const router = express.Router();

router.get('/', videoController.getAllVideos);
router.get('/:videoid', videoController.getVideoById);
router.post('/', videoController.createVideo);
router.put('/:videoid', videoController.updateVideo);
router.delete('/:videoid', videoController.deleteVideo);

module.exports = router;