// ProgressRoutes.js
const express = require("express");
const router = express.Router();
const ProgressControllers = require("../controller/Progress/ProgressContreller");


router.post("/", ProgressControllers.createProgress);
router.put("/", ProgressControllers.exitProgress);
router.get("/", ProgressControllers.getLiveProgress);

module.exports = router