// Perjalanan.js (adalah routenya perjalanan)
const express = require("express");
const router = express.Router();
const PerjalananController = require("../controller/Perjalanan/PerjalananController");

router.post("/", PerjalananController.createPerjalanan);
router.get("/", PerjalananController.getPerjalanan);

module.exports = router;