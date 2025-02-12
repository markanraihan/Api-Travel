// jwt.js (dalam folder utils)
const jwt = require("jsonwebtoken");
const { v4: uuidv4 } = require("uuid");

const JwtUtils = {
  verifyToken: (token) => {
    try {
      return jwt.verify(token, process.env.JWT_SECRET);
    } catch (err) {
      throw new Error("Token tidak valid");
    }
  },
  generateToken : (role, userId, roomId) => {
    const iat = Math.floor(Date.now() / 1000);
    const exp = iat + 24 * 60 * 60;
  
    return jwt.sign(
      {
        version: 2,
        type: "app",
        access_key: process.env.HMS_ACCESS_KEY,
        role,
        room_id: roomId,
        user_id: userId,
        exp,
        iat,
        nbf: iat,
        iss: process.env.HMS_ACCESS_KEY,
        sub: "api",
        jti: uuidv4(),
      },
      process.env.HMS_SECRET
    );
  },
};


module.exports = JwtUtils;
