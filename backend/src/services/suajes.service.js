const suajesmodel = require('../models/suajes.model');

class SuajesService {
    SuajesService() {}

    async guardarsuaje(suaje = new suajesmodel()) {
        try {
            var suajeGuardado;
            await suajesmodel.create(suaje).then( (value) => {
                suajeGuardado =  value;
            });

            return suajeGuardado;

        } catch (error) {
            console.log(error);

        }
    }

    async consultarsuajes() {
        try {

            return await suajesmodel.find();
        } catch (error) {
            return error;

        }
    }

    async eliminarsuaje(idc) {
        console.log(idc);
        var suajeeliminado;
        try {
            await suajesmodel.findOneAndRemove({
                _id: idc
            }).then( (value) => {
                console.log(value);
                suajeeliminado = value;
            });

            return suajeeliminado;
        } catch (error) {
            console.log(error);

        }
    }

    async modificarsuaje(suajemod) {

        var suajemodificado;
        try {
            await suajesmodel.findOneAndUpdate({
                _id: suajemod._id
            }, suajemod).then( (value) => {

                suajemodificado = suajemod;
            });

            return suajemodificado;
        } catch (error) {
            console.log(error);

        }
    }
}

module.exports = new SuajesService();

