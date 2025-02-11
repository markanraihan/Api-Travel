// GroupRoutes.js
const express = require('express');
const router = express.Router();
const GrupController = require('../controller/Grup/GroupController');
const Ustadz = require('../middleware/Ustadz');
const admin = require('../middleware/admin');
const Users = require('../middleware/Users');

// membuat grup
router.post('/',Ustadz, GrupController.createGrup);
router.post('/admin',admin, GrupController.createGrupAdmin);

// Join grup
router.post('/join',Users, GrupController.joinGrup);

// Mendapatkan semua grup
router.get('/', GrupController.getGrup);
router.get('/peserta', GrupController.cekPesertaGrup);

// Mengecek detail grup berdasarkan ID grup
router.get('/cekGrup/:grupid', GrupController.cekGrup);

// Mengecek apakah user ada dalam grup
router.get('/cekUserGrup', GrupController.cekUserGrup);

// Mengecek jumlah user yang online dalam grup
router.get('/cekLive/:grupid', GrupController.cekLive);

// keluar Grup
router.post('/exit', GrupController.exitGrup)

// menghapus grup
router.delete('/:grupid',Ustadz, GrupController.deleteGrup);

// Get Live
router.get('/getCekLive', GrupController.getCekLive)

// Get Status Perjalanan semua grup
router.get('/getStatusPerjalanan/:grupid', GrupController.getStatusPerjalanan);

module.exports = router;
