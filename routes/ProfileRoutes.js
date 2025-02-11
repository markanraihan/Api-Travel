const express = require("express");
const router = express.Router();
const upload = require("../utils/multer");
const auth = require("../middleware/Users");
const ProfileController = require("../controller/Profile/ProfileController");

router.get("/me", auth, ProfileController.getProfileByToken);
router.get("/", auth, ProfileController.getAllUsers);
router.put("/", auth, upload.single("photo"), ProfileController.updateProfileByToken);
//UpdateProfileBytoken

module.exports = router;
