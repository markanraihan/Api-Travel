// ProfileController.js
const ProfileServices = require("../../services/Profile/profileServices");

const getAllUsers = async (req, res) => {
  try {
    const result = await ProfileServices.getAllUsers(req);
    res.status(result.status).json(result.data);
  } catch (err) {
    console.error("Error in getAllUsers Controller:", err.message);
    res.status(500).send({ msg: "Server error", error: err.message });
  }
};
const getProfileByToken = async (req, res) => {
  try {
    const { token } = req.headers;
    const result = await ProfileServices.getProfileByToken(token, req);
    res.status(result.status).json(result.data);
  } catch (err) {
    console.error("Error in getProfileByToken Controller:", err.message);
    res.status(500).send({ msg: "Server error", error: err.message });
  }
};

const updateProfileByToken = async (req, res) => {
  try {
    const { name, whatsapp } = req.body;
    const photo = req.file ? `/${req.file.filename}` : null;
    const result = await ProfileServices.updateProfileByToken(req.user.id, { name, whatsapp, photo });
    res.status(result.status).json(result.data);
  } catch (err) {
    console.error("Error in updateProfileByToken Controller:", err.message);
    res.status(500).send({ msg: "Server error", error: err.message });
  }
};
module.exports = {
  getAllUsers,
  getProfileByToken,
  updateProfileByToken,
};
