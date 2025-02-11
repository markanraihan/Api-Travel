// GroupService.js
const GrupRepository = require("../../repositories/Grup/GrupRepository");
const jwtUtils = require("../../utils/jwt");

const createGrupAdmin = async (token, nama_grup) => {
  // Verifikasi JWT
  const responseJWT = jwtUtils.verifyToken(token);

  // Cari user berdasarkan ID dari token
  const user = await GrupRepository.findUserById(responseJWT.user.id);

  if (!user) {
    throw new Error("User not found");
  }

  if (user.role !== "admin") {
    throw new Error("Hanya admin yang bisa membuat grup tanpa batasan.");
  }

  // Buat grup baru
  const newGrup = await GrupRepository.createGrup(nama_grup, user.name, responseJWT.user.id);

  return newGrup;
};
module.exports = {
  createGrupAdmin,
};
