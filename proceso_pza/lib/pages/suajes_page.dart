
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import '../modelos/existente.model.dart';
import '../modelos/historial.model.dart';
import '../modelos/suajes.model.dart';
import '../peticiones/existente.peticion.dart';
import '../peticiones/historial.peticion.dart';
import '../peticiones/suajes.peticion.dart';
import 'search_suaje.dart';


var _flitro = [];

class SuajesPage extends StatefulWidget {
  final String _title;

  // ignore: use_key_in_widget_constructors
  const SuajesPage(this._title);
  @override
  State<StatefulWidget> createState() => _SuajesPage();
}

class _SuajesPage extends State<SuajesPage> {
  @override
  void initState() {
    setState(() {
      listSuajes().then((value) {
  
      });
    });
    //super.dispose();
  }

//
  String _scanBarcode = '';

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 31, 52, 240),
          actions: [
            
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                List<Suajes> _s = <Suajes>[];
              
                listSuajes().then((value) {
                  _s.addAll(value);
                
                }
              

                );
               // _s.removeWhere((element) => element.state != 'entrada');
                showSearch(context: context, delegate: SearchSuaje(_s));
              },
            )
          ],
          title: Text(
            widget._title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: getSuajes(context, listSuajes()),
       /*  bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Color.fromARGB(255, 31, 52, 240),
             selectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 31, 52, 240)),
             selectedItemColor: Color.fromARGB(255, 31, 52, 240),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.document_scanner_sharp),
                label: 'Agregar prodcuto',
              ),
              BottomNavigationBarItem(
                //nselectedItemColor: Colors.deepOrangeAccent,
                icon: Icon(
                  Icons.edit_note,
                ),

                label: 'Editar Producto',
              ),
            ], onTap: _onItemTapped) */);
  }

  Widget getSuajes(
      BuildContext context, Future<List<Suajes>> futureSuajes) {
    return FutureBuilder(
      future: futureSuajes,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el cargando...
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if (snapshot.hasError) {
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            // print(snapshot.data);
            return snapshot.data != null
                ? suajesList(snapshot.data)
                : Container(
                    alignment: Alignment.center,
                    child: const Center(
                      child: Text('Sin Datos'),
                    ),
                  );
          default:
            return const Text('Recarga la pantalla....!');
        }
      },
    );
  }

  Widget suajesList(List<Suajes> Suajes) {
    DateTime now = DateTime.now();
    String fecha = DateFormat('yyyy-MM-dd').format(now);
   
    return ListView.builder(
      itemCount: Suajes.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/suajes.png')),
            onLongPress: () {
              // removeClient(context, Suajess[index]);
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      Suajes[index].MODELO,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                const Text('Cliente'),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      Suajes[index].DESCRIPCION,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      Suajes[index].MEDIDAMPRIMA,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Text(
                  Suajes[index].CLIENTE,
                ),
              ],
            ));
//
      },
    );
  }
}
