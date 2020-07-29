import 'package:flutter/material.dart';
import 'package:shareprefapp/src/screens/home_screen.dart';
import 'package:shareprefapp/src/screens/settings_screen.dart';
import 'package:shareprefapp/src/share_prefs/user_preferenses.dart';
 
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new AppPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {

  final prefs = new AppPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.lastScreen,
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      },
    );
  }
}