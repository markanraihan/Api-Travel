const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, '../assets/'));
  },
  filename: (req, file, cb) => {
    const hashNameImage = require('crypto').randomBytes(16).toString('hex');
    const getExtensionImage = path.extname(file.originalname);
    cb(null, `${hashNameImage}${getExtensionImage}`);
  },
});

const upload = multer({ storage });

module.exports = { upload };

