import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proceso_pza/modelos/suajes.model.dart';

import '../modelos/existente.model.dart';
import '../modelos/historial.model.dart';
import '../modelos/producto.model.dart';
import '../peticiones/existente.peticion.dart';
import '../peticiones/historial.peticion.dart';
import '../peticiones/producto.peticion.dart';
import '../pages/text_box.dart';

class CaluclarMP extends StatefulWidget {
  final Suajes _suajes;
  CaluclarMP(this._suajes);
  @override
  State<StatefulWidget> createState() => _CaluclarMP();
}

class _CaluclarMP extends State<CaluclarMP> {
  late TextEditingController controllerModelo;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerMedidaMateriaP;
  late TextEditingController controllerCalibre;
  late TextEditingController controllerCliente;
  late TextEditingController controllerTipoSuaje;
  late TextEditingController controllerMaquina;
  late TextEditingController controllerCantidad;
  late TextEditingController controllerPiezaxset;
  late TextEditingController controllerPzaEnSuaje;

  late String id;

  @override
  String t = '';
  void initState() {
    Suajes p = widget._suajes;

    controllerModelo = TextEditingController(text: p.MODELO);
    controllerDescripcion = TextEditingController(text: p.DESCRIPCION);
    controllerMedidaMateriaP = TextEditingController(text: p.MEDIDAMPRIMA);
    controllerCalibre = TextEditingController(text: p.CALIBRE);
    controllerCliente = TextEditingController(text: p.CLIENTE);
    controllerTipoSuaje = TextEditingController(text: p.TIPODESUAJE);
    controllerMaquina = TextEditingController(text: p.MAQUINA);
    controllerPiezaxset = TextEditingController(text: p.PZASXSET);
    controllerPzaEnSuaje = TextEditingController(text: p.PZASENELSUAJE);
    controllerCantidad = TextEditingController();

    id = p.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calular Laminas a usar"),
        backgroundColor: Color.fromARGB(255, 31, 52, 240),
      ),
      body: ListView(
        children: [
          TextBox(controllerModelo, "Modelo", false),
          TextBox(controllerDescripcion, 'Descripcion', false),
          TextBox(controllerMedidaMateriaP, 'Materia Prima que ocupa', false),
          TextBox(controllerCalibre, 'Calibre', false),
          TextBox(controllerCliente, 'Cliente', false),
          TextBox(controllerTipoSuaje, 'Tipo de Suaje', false),
          TextBox(controllerMaquina, 'Maquina para su uso', false),
          TextBox(controllerCantidad, 'CANTIDAD EN SETS/PRODUCCION ', true),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  // background color
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(100, 40)),
              child: const Text(
                'Regresar',
              ),
            ),
            const SizedBox(height: 100, width: 100),
            ElevatedButton(
                onPressed: () async {
                  String modelo = controllerModelo.text;
                  String descripcion = controllerDescripcion.text;
                  String MedidasMP = controllerMedidaMateriaP.text;
                  String calibre = controllerCalibre.text;
                  String cliente = controllerCliente.text;
                  String tipoSuaje = controllerTipoSuaje.text;
                  String Maquina = controllerMaquina.text;
                  String Cantidad = controllerCantidad.text;
                  String PzaSet = controllerPiezaxset.text;
                  String PzaSuaje = controllerPzaEnSuaje.text;

                  String totalLaminas =
                      (int.parse(Cantidad)  /
                              int.parse(PzaSuaje))
                          .toString();

                  print(totalLaminas);
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Informarcion sobre el modelo"),
                      content: Text(
                          "Las laminas que se ocuparan para el modelo $modelo \n Seran $totalLaminas con medidad de $MedidasMP y calibre $calibre"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },


                          child: Text("Ok"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // background color
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(100, 40)),
              
                child: const Text("Calcular"))
          ]),
        ],
      ),
    );
  }
}
