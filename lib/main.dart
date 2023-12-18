import 'package:flutter/material.dart';
import 'package:seminario5/screens/home_screen.dart';
import 'package:seminario5/screens/settings_screen.dart';
import 'package:seminario5/shared_prefs/user_preferences.dart';
import 'package:seminario5/shared_prefs/user_preferences_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await UserPreferences_2.getInstance();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Preferencias",
      initialRoute: "home",
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        AjustesScreen.routeName: (BuildContext context) => AjustesScreen()
      },
    );
  }
}
