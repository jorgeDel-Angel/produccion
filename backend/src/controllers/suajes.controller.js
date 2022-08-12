const SuajeService = require('../services/suajes.service');


const agregarsuajes = async (req, res) => {
    console.log(req.body);
    res.json({
       suaje: await SuajeService.guardarsuaje(req.body)

    })

}

const consultarsuajes = async(req, res) => {
    res.json({
        suajes: await SuajeService.consultarsuajes()
    })
}

const modificarsuaje = async(req, res) => {
    res.json({
        suaje: await SuajeService.modificarsuaje(req.body)
    })
}

const eliminarsuaje = async(req, res) => {
    res.json({
        suaje: await SuajeService.eliminarsuaje(req.params.id)
    })
}



module.exports = {consultarsuajes, agregarsuajes, modificarsuaje, eliminarsuaje};