import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modelos/suajes.model.dart';

import '../peticiones/suajes.peticion.dart';
import 'modify_product.dart';

class SearchSuaje extends SearchDelegate {
  final List<Suajes> suaje;
  List<Suajes> _filter = [];

  SearchSuaje(this.suaje);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, listSuajes());
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _filter = suaje.where((element) {
      return element.MODELO.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CaluclarMP(_filter[index])),
                );
              },
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/suajes.png')),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        _filter[index].MODELO,
                        textAlign: TextAlign.left,
                      ),
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
                        _filter[index].DESCRIPCION,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        _filter[index].MEDIDAMPRIMA,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Text(
                    _filter[index].CLIENTE,
                  ),
                ],
              ));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = suaje.where((element) {
      return element.MODELO.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CaluclarMP(_filter[index])),
                );
              },
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/suajes.png')),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        _filter[index].MODELO,
                        textAlign: TextAlign.left,
                      ),
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
                        _filter[index].DESCRIPCION,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        _filter[index].MEDIDAMPRIMA,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Text(
                    _filter[index].CLIENTE,
                  ),
                ],
              ));
        });
  }
}
