const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');

dotenv.config();

module.exports = function (req, res, next) {
    const token = req.header('token');

    if(!token){
        return res.status(401).json({ msg: 'No token, authorization denied' });
    }
    try{
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded.user;

        if(req.user.role !=='ustadz'){
            return res.status(401).json({ msg: 'Hanya ustadz/pembimbing yang bisa membuat grup' });
        }

        next();
        }   catch(err){
        res.status(401).json({ msg: 'Token is not valid' });
    }
}