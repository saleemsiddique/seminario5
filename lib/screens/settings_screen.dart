import 'package:flutter/material.dart';
import 'package:seminario5/screens/home_screen.dart';
import 'package:seminario5/screens/settings_screen.dart';
import 'package:seminario5/shared_prefs/user_preferences.dart';
import 'package:seminario5/shared_prefs/user_preferences_2.dart';
import 'package:seminario5/widgets/drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AjustesScreen extends StatefulWidget {
  const AjustesScreen({super.key});
  static const String routeName = "settings";

  @override
  State<AjustesScreen> createState() => _AjustesScreenState();
}

class _AjustesScreenState extends State<AjustesScreen> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';
  TextEditingController _textController = TextEditingController();
  final prefs = UserPreferences();
  final prefs2 = UserPreferences_2();

  @override
  void initState() {
    // Esto se disparará antes del build
    super.initState();
    _textController = TextEditingController(text: prefs2.getData("nombre"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferencias de usuario"),
        backgroundColor: (prefs2.getData("colorSecundario")) ? Colors.teal : Colors.blue,
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          child: const Text('Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
        ),
        const Divider(),
        SwitchListTile(
            value: prefs2.getData("colorSecundario"),
            title: const Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                //prefs.colorSecundario = value;
                prefs2.saveData("colorSecundario", value);
              });
            }),
        RadioListTile(
            value: 1,
            title: const Text('Masculino'),
            groupValue: prefs2.getData("genero"),
            onChanged: (value) {
              prefs2.saveData("genero", value);
              setState(() {});
            }),
        RadioListTile(
            value: 2,
            title: const Text('Femenino'),
            groupValue: prefs2.getData("genero"),
            onChanged: (value) {
              //prefs.genero = value!;
              prefs2.saveData("genero", value);
              setState(() {});
            }),
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _textController,
            onChanged: (value) => setState(
              () {
                //prefs.nombre = value;
                prefs2.saveData("nombre", value);
              },
            ),
            decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la peresona usando el teléfono'),
          ),
        )
      ]),
      drawer: DrawerMenu(),
    );
  }
}
