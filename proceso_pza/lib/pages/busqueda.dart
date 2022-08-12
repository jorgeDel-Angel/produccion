import 'package:flutter/material.dart';
import 'package:proceso_pza/main.dart';
import 'package:proceso_pza/pages/lista_modelos.dart';


class BusquedaPage extends StatelessWidget {
  
  const BusquedaPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> Lista = [];

    const appTitle = 'Busqueda por Modelo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});
  // final formKey = GlobalKey<FormState>();
  // final Lista = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ingresa Modelo',
              icon: Icon(Icons.search),
            ),
          ),
        ),
        
      ],
    );
  }
}