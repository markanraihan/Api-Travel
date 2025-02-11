const express = require("express");
const router = express.Router();
const { check } = require("express-validator");
const dotenv = require("dotenv");
const auth = require("../middleware/Users");
const AuthController = require("../controller/Auth/AuthController");

dotenv.config();

// @route    POST api/auth/register
// @desc     Register user
// @access   Public

router.post(
  "/register",
  [
    check("name", "name is required").not().isEmpty(),
    check("email", "Please include a valid email").isEmail(),
    check("password", "Please enter a password with 6 or more characters").isLength({ min: 6 }),
    check("whatsapp", "whatsapp is required").not().isEmpty(),
  ],
  AuthController.register
);

// @route    POST api/auth/login
// @desc     Authenticate user & get token
// @access   Public
router.post("/login", [check("email", "Please include a valid email").isEmail(), check("password", "Password is required").exists()], AuthController.login);

router.post("/logout", auth, AuthController.logout);

//change passowrd
router.put("/password", auth, AuthController.changePassword);

module.exports = router;
