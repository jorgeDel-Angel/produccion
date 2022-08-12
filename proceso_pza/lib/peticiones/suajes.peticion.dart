import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


import '../modelos/suajes.model.dart';

Future<List<Suajes>> listSuajes() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.237:4000/api/suajes'));

  return compute(goToList, response.body);
}

List<Suajes> goToList(String responseBody) {
  final pasar = json.decode(responseBody);

  return pasar['suajes']
      .map<Suajes>((json) => Suajes.fromJson(json))
      .toList();
}

mapSuajes(Suajes suaje, bool mapId) {
  Map data;
  if (mapId) {
    data = {

    'id':  '${suaje.id}',
    'CLIENTE':  '${suaje.CLIENTE}',
    'MODELO':  '${suaje.MODELO}',
    'DESCRIPCION':  '${suaje.DESCRIPCION}',
    'MEDIDAMPRIMA':  '${suaje.MEDIDAMPRIMA}',
    'ANCHO':  '${suaje.ANCHO}',
    'LARGO':  '${suaje.LARGO}',
    'PZASXSET':  '${suaje.PZASXSET}',
    'PZASENELSUAJE':  '${suaje.PZASENELSUAJE}',
    'CALIBRE':  '${suaje.CALIBRE}',
    'TIPODESUAJE':  '${suaje.TIPODESUAJE}',
    'MAQUINA':  '${suaje.MAQUINA}',
    'NUMERO':  '${suaje.NUMERO}',




    };
  } else {
    data = {

 
    'CLIENTE':  '${suaje.CLIENTE}',
    'MODELO':  '${suaje.MODELO}',
    'DESCRIPCION':  '${suaje.DESCRIPCION}',
    'MEDIDAMPRIMA':  '${suaje.MEDIDAMPRIMA}',
    'ANCHO':  '${suaje.ANCHO}',
    'LARGO':  '${suaje.LARGO}',
    'PZASXSET':  '${suaje.PZASXSET}',
    'PZASENELSUAJE':  '${suaje.PZASENELSUAJE}',
    'CALIBRE':  '${suaje.CALIBRE}',
    'TIPODESUAJE':  '${suaje.TIPODESUAJE}',
    'MAQUINA':  '${suaje.MAQUINA}',
    'NUMERO':  '${suaje.NUMERO}',

    };
  }

  return data;
}

Future<Suajes> addSuaje(Suajes suaje) async {
  var url = Uri.parse('http://192.168.1.237:4000/api/suajes/registro');

  var body = json.encode(mapSuajes(suaje, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);

  if (response.statusCode == 200) {
    return Suajes.fromJson(jsonDecode(response.body)['suaje']);
  } else {
    throw Exception('Failed to load suaje');
  }
}

Future<Suajes> deleteSuaje(String suajeId) async {
  final http.Response response = await http.delete(
    Uri.parse('http://192.168.1.237:4000/api/suajes/eliminar/$suajeId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Suajes.fromJson(jsonDecode(response.body)['suaje']);
  } else {
    throw Exception('Failed to Delete suajes');
  }
}
  
Future<Suajes> modifySuajes(Suajes suaje) async {
  var url = Uri.parse('http://192.168.1.237:4000/api/suajes/modificar');

  var body = json.encode(mapSuajes(suaje, true));

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return Suajes.fromJson(jsonDecode(response.body)['suaje']);
  } else {
    throw Exception('Failed to modify suajes');
  }
}
