import 'package:fluent_ui/fluent_ui.dart';
import 'package:proceso_pza/pages/calcular.dart';

import 'package:proceso_pza/pages/pages.dart';

import 'package:proceso_pza/peticiones/suajes.peticion.dart';

import '../modelos/suajes.model.dart';
import 'modify_product.dart';
import 'stock_page.dart';
import 'suajes_page.dart';





class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIdex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: const NavigationAppBar(
        leading: Center(
          child: FlutterLogo(size: 25),
        ),
      ),
      pane: NavigationPane(
        header: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: DefaultTextStyle(
            style: FluentTheme.of(context).typography.title!,
            child: const Text('Produccion NPC'),
          ),
          
        ),
        items: [
             PaneItem(
            icon: const Icon(FluentIcons.search),
            title: const Text('Busqueda'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.calculated_table),
            title: const Text('Stock de Embarques'),
          ),
            
       
        ],
        selected: _currentIdex,
        displayMode: PaneDisplayMode.auto,
        onChanged: (i) {
          setState(() {
            _currentIdex = i;
          });
        },
      ),
      content: NavigationBody(
        index: _currentIdex,
        children: const [
          //StockPage(),
          SuajesPage('Suajes'),
          StockPage(),
          
         

        ],
      ),
    );
  }
}