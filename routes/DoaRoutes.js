// DoaRoutes.js
const express = require("express");
const {
  getAllDoa,
  getDoaById,
  createDoa,
  updateDoa,
  deleteDoa,
} = require("../controller/Doa/DoaController");

const router = express.Router();

router.get("/", getAllDoa);
router.get("/:id", getDoaById);
router.post("/", createDoa);
router.put("/:id", updateDoa);
router.delete("/:id", deleteDoa);

module.exports = router;