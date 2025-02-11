const express = require("express");
const router = express.Router();
const setStatus = require("../controller/SetStatus/SetStatus");

router.post("/Online", setStatus.setStatusOnline);
router.post("/Offline", setStatus.setStatusOffline);

module.exports = router;