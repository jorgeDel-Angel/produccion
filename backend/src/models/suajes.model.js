

const { Schema, model } = require('mongoose');
const suajesSchema = new Schema({
    
    CLIENTE       :String,
    MODELO         :String,
    DESCRIPCION    :String,
    MEDIDAMPRIMA   :String, 
    ANCHO         :String,
    LARGO         :String,
    PZASXSET       :String,
    PZASENELSUAJE  :String,
    CALIBRE       :String,
    TIPODESUAJE   :String,
    MAQUINA       :String,
    NUMERO         :String,

    

    

    
})

module.exports = model('Suaje', suajesSchema);


