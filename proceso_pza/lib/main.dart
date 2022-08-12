import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';


import 'package:proceso_pza/pages/pages.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'NPC PRODUCCION',
    
      home: NavigationScreen(),
    );
  }
}