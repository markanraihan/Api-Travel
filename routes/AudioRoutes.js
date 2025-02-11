const express = require("express");
const router = express.Router();
const ustadz = require("../middleware/Ustadz");
const AudioController = require("../controller/Audio/AudioController");
const auth = require("../middleware/Users");
const authMiddleware = require("../middleware/authMiddleware");
const { users } = require("../utils/Prisma");

// generate Token
router.post("/generateToken", AudioController.createRoom);

// get Room
router.get("/getRoom", AudioController.getRoom);

// refresh token
router.post("/refreshToken", authMiddleware, auth, AudioController.refreshRoomToken);
router.get("/getRoomByid", authMiddleware, auth, AudioController.getRoomByid);

router.post("/assignRoom", AudioController.assignRoomToGroup);

module.exports = router;
