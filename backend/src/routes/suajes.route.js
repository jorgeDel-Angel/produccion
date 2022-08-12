const { Router } = require('express');
const { consultarsuajes, agregarsuajes, modificarsuaje, eliminarsuaje} = require('../controllers/suajes.controller')
const router = Router();


router.get('/api/suajes', consultarsuajes);
router.post('/api/suajes/registro', agregarsuajes);
router.put('/api/suajes/modificar', modificarsuaje);
router.delete('/api/suajes/eliminar/:id', eliminarsuaje);



module.exports = router;