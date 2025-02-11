const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
const prisma = require("../utils/Prisma");
dotenv.config();

module.exports = async function (req, res, next) {
  const token = req.header("token");

  if (!token) {
    return res.status(401).json({ message: "No token, authorization denied" });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded.user;

    // Cek status login pengguna di database
    const user = await prisma.users.findUnique({ where: { id: req.user.id } });

    // Pastikan token yang diterima masih valid dengan memeriksa currentToken
    if (!user || user.currentToken !== token) {
      return res.status(401).json({ msg: "Token is not valid or has been replaced" });
    }

    if (!user || !user.status_login) {
      return res.status(401).json({ message: "Session expired, please login again" });
    }

    next();
  } catch (err) {
    res.status(401).json({ message: "Token is not valid" });
  }
};
