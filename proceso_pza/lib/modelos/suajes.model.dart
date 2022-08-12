class Suajes {
  var id;
  var CLIENTE;
  var MODELO;
  var DESCRIPCION;
  var MEDIDAMPRIMA;
  var ANCHO;
  var LARGO;
  var PZASXSET;
  var PZASENELSUAJE;
  var CALIBRE;
  var TIPODESUAJE;
  var MAQUINA;
  var NUMERO;

  Suajes({
    this.id,
    this.CLIENTE,
    this.MODELO,
    this.DESCRIPCION,
    this.MEDIDAMPRIMA,
    this.ANCHO,
    this.LARGO,
    this.PZASXSET,
    this.PZASENELSUAJE,
    this.CALIBRE,
    this.TIPODESUAJE,
    this.MAQUINA,
    this.NUMERO,
  });

  factory Suajes.fromJson(Map<String, dynamic> json) {
    return Suajes(
        id: json['_id'],
        CLIENTE: json['CLIENTE'],
        MODELO: json['MODELO'],
        DESCRIPCION: json['DESCRIPCION'],
        MEDIDAMPRIMA: json['MEDIDAMPRIMA'],
        ANCHO: json['ANCHO'],
        LARGO: json['LARGO'],
        PZASXSET: json['PZASXSET'],
        PZASENELSUAJE: json['PZASENELSUAJE'],
        CALIBRE: json['CALIBRE'],
        TIPODESUAJE: json['TIPODESUAJE'],
        MAQUINA: json['MAQUINA'],
        NUMERO: json['NUMERO']);
  }
}
