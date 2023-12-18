import 'package:flutter/material.dart';
import 'package:seminario5/shared_prefs/user_preferences.dart';
import 'package:seminario5/shared_prefs/user_preferences_2.dart';
import 'package:seminario5/widgets/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prefs = new UserPreferences();
  final prefs2 = new UserPreferences_2();

  @override
   void initState() {
    super.initState();
    prefs.lastPage = HomeScreen.routeName;
  }

  Widget build(BuildContext context) {
     prefs.lastPage = HomeScreen.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferemcias de usuario'),
        backgroundColor: (prefs2.getData("colorSecundario")) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text("Nombre usuario: ${prefs2.getData("nombre")}"),
          Divider(),
           Text("Género: ${prefs2.getData("genero")}"),
          Divider(),
          Text("Color secundario: ${prefs2.getData("colorSecundario")}"),
          Divider(),
        ],
      ),
    );
  }
}