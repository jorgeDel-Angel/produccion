import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:proceso_pza/widget/button_widget.dart';

import '../data/city_data.dart';
import '../data/food_data.dart';

class CalcularPage extends StatelessWidget {
  const CalcularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: CalcularPageForm(),
    );
  }
}

class CalcularPageForm extends StatefulWidget {
  const CalcularPageForm({super.key});

  @override
  State<CalcularPageForm> createState() => _CalcularPageFormState();
}

class _CalcularPageFormState extends State<CalcularPageForm> {
 final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final controllerCity = TextEditingController();
  final controllerFood = TextEditingController();

    String? selectedCity;
  String? selectedFood;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piezas : Lamina'),
      ),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildCity(),
                    SizedBox(height: 16),
                    buildFood(),
                    SizedBox(height: 12),
                    buildFood2(),
                    SizedBox(height: 12),
                    buildFood3(),
                    SizedBox(height: 12),
                    
                    
                    buildSubmit(context)
                  ],
                ),
              ),
            ),
          ),
      
      // floatingActionButton: FloatingActionButton(
      //   // When the user presses the button, show an alert dialog containing
      //   // the text that the user has entered into the text field.
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           // Retrieve the text the that user has entered by using the
      //           // TextEditingController.
      //           content: Text(myController.text),
      //         );
      //       },
      //     );
      //   },
      //   tooltip: 'Show me the value!',
      //   child: const Icon(Icons.text_fields),
      ),
    );
  }
   Widget buildCity() => TypeAheadFormField<String?>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: controllerCity,
          decoration: InputDecoration(
            labelText: 'MODELO DE LA PIEZA',
            border: OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: CityData.getSuggestions,
        itemBuilder: (context, String? suggestion) => ListTile(
          title: Text(suggestion!),
        ),
        onSuggestionSelected: (String? suggestion) =>
            controllerCity.text = suggestion!,
        validator: (value) =>
            value != null && value.isEmpty ? 'FAVOR DE INGRESAR UN MODELO' : null,
        onSaved: (value) => selectedCity = value,
      );

  Widget buildFood() => TypeAheadFormField<String?>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: controllerFood,
          decoration: InputDecoration(
            labelText: 'PIEZAS REQUERIDAS',
            border: OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: FoodData.getSuggestions,
        itemBuilder: (context, String? suggestion) => ListTile(
          title: Text(suggestion!),
        ),
        onSuggestionSelected: (String? suggestion) =>
            controllerFood.text = suggestion!,
        validator: (value) =>
            value != null && value.isEmpty ? 'FAVOR DE INGRESAR LAS PIEZAS REQUERIDAS' : null,
        onSaved: (value) => selectedFood = value,
      );
   
    Widget buildFood2() => TypeAheadFormField<String?>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: controllerFood,
          decoration: InputDecoration(
            labelText: 'LAMINAS REQUERIDAS',
            border: OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: FoodData.getSuggestions,
        itemBuilder: (context, String? suggestion) => ListTile(
          title: Text(suggestion!),
        ),
        onSuggestionSelected: (String? suggestion) =>
            controllerFood.text = suggestion!,
        validator: (value) =>
            value != null && value.isEmpty ? 'FAVOR DE INGRESAR LAS PIEZAS REQUERIDAS' : null,
        onSaved: (value) => selectedFood = value,
      );

 Widget buildFood3() => TypeAheadFormField<String?>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: controllerFood,
          decoration: InputDecoration(
            labelText: 'DESCRIPCION',
            border: OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: FoodData.getSuggestions,
        itemBuilder: (context, String? suggestion) => ListTile(
          title: Text(suggestion!),
        ),
        onSuggestionSelected: (String? suggestion) =>
            controllerFood.text = suggestion!,
        validator: (value) =>
            value != null && value.isEmpty ? 'FAVOR DE INGRESAR LAS PIEZAS REQUERIDAS' : null,
        onSaved: (value) => selectedFood = value,
      );

  Widget buildSubmit(BuildContext context) => ButtonWidget(
        text: 'CALCULAR',
        onClicked: () {
          final form = formKey.currentState!;

          if (form.validate()) {
            form.save();

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                    'Your Favourite City is $selectedCity\nYour Favourite Food is $selectedFood'),
              ));
          }
        },
      );
}