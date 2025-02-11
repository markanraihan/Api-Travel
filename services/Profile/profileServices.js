const profileRepository = require("../../repositories/Profile/profileRepository");
const jwt = require("jsonwebtoken");

const getAllUsers = async (req) => {
  try {
    const users = await profileRepository.findAllUsers();
    const usersWithPhoto = users.map((user) => ({
      ...user,
      profile: {
        photo: user.profile?.photo
          ? `${req.protocol}://${req.get("host")}${user.profile.photo}`
          : null,
      },
    }));

    return { status: 200, data: { msg: "Users fetched", data: usersWithPhoto } };
  } catch (err) {
    console.error("Error in getAllUsers Service:", err.message);
    throw new Error(err.message);
  }
};

const getProfileByToken = async (token, req) => {
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await profileRepository.findUserById(decoded.user.id);

    if (!user) {
      return { status: 404, data: { msg: "Akun tidak ditemukan" } };
    }

    user.profile.photo = user.profile?.photo
      ? `${req.protocol}://${req.get("host")}${user.profile.photo}`
      : null;

    return { status: 200, data: { msg: "Profile fetched", data: user } };
  } catch (err) {
    console.error("Error in getProfileByToken Service:", err.message);
    throw new Error(err.message);
  }
};

const updateProfileByToken = async (userId, { name, whatsapp, photo }) => {
  try {
    const profile = await profileRepository.findProfileByUserId(userId);

    if (profile) {
      const updatedProfile = await profileRepository.updateProfile(userId, { name, whatsapp, photo });
      await profileRepository.updateUser(userId, { name, whatsapp });
      return { status: 200, data: { msg: "Profile updated", data: updatedProfile } };
    }

    const newProfile = await profileRepository.createProfile(userId, { name, whatsapp, photo });
    await profileRepository.updateUser(userId, { name, whatsapp });
    return { status: 201, data: { msg: "Profile created", data: newProfile } };
  } catch (err) {
    console.error("Error in updateProfileByToken Service:", err.message);
    throw new Error(err.message);
  }
};

module.exports = {
  getAllUsers,
  getProfileByToken,
  updateProfileByToken,
};
