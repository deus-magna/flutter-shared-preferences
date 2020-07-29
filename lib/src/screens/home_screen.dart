import 'package:flutter/material.dart';
import 'package:shareprefapp/src/screens/settings_screen.dart';
import 'package:shareprefapp/src/share_prefs/user_preferenses.dart';
import 'package:shareprefapp/src/widgets/menu_widget.dart';

class HomeScreen extends StatelessWidget {

  final prefs = new AppPreferences();
  static final String routeName = 'home';

@override
  Widget build(BuildContext context) {

    prefs.lastScreen = HomeScreen.routeName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        title: Text('Preferencias de Usuario')),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.secondaryColor}'),
          Divider(),
          Text('Género: ${prefs.gender}'),
          Divider(),
          Text('Nombre usuario: ${prefs.username}'),
          Divider(),
        ],
      ),
    );
  }
}