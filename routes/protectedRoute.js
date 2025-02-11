const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');

// @route    GET api/protected
// @desc     Protected route example
// @access   Private
router.get('/', auth, (req, res) => {
  try {
    // autentikasi, seperti mengirimkan data pengguna atau melakukan tindakan tertentu
    res.json({ msg: 'Access to protected route granted', user: req.user });
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server Error');
  }
});

module.exports = router;

// Duplicate file ProtectedRoute ini bisa di hapus