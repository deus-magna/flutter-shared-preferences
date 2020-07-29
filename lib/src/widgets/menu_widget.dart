import 'package:flutter/material.dart';

import 'package:shareprefapp/src/screens/home_screen.dart';
import 'package:shareprefapp/src/screens/settings_screen.dart';

class MenuWidget extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
            
            ),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/original.jpg'),
              fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Home'),
            onTap: ()=> Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: ()=> Navigator.pushReplacementNamed(context, SettingsScreen.routeName),
          )
        ],
      ),
    );
  }
}