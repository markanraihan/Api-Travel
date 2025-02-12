// ProgressContreller.js 
const ProgressServices = require("../../services/Progress/ProgressServices");

const  createProgress= async (req, res) => {
  const { grupid, perjalananid } = req.body;
  try {
    const result = await ProgressServices.createProgress(grupid, perjalananid);
    return res.status(result.status).json(result.data);
  } catch (err) {
    console.error("Error in createProgress Controller:", err.message);
    return res.status(500).send({ msg: "Server error", error: err.message });
  }
};

const exitProgress = async (req, res) => {
  const { progressid } = req.body;
  try {
    const result = await ProgressServices.exitProgress(progressid);
    res.status(200).json({ msg: "Progress berhasil dihentikan", data: result });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

const getLiveProgress = async (req, res) => {
  try {
    const progress = await ProgressServices.getLiveProgress();
    res.status(200).json({ msg: "Progress live ditemukan", data: progress });
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

module.exports = {
  createProgress,
  getLiveProgress,
  exitProgress,
};