import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shareprefapp/src/share_prefs/user_preferenses.dart';
import 'package:shareprefapp/src/widgets/menu_widget.dart';

class SettingsScreen extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _secondaryColor;
  int _gender;
  String _name;

  TextEditingController _textController;
  final prefs = new AppPreferences();

  @override
  void initState() {
    super.initState();

    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _textController = new TextEditingController(text: prefs.username);
    prefs.lastScreen = SettingsScreen.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
          title: Text('Ajustes')),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              onChanged: (value) {
                _secondaryColor = value;
                prefs.secondaryColor = value;
                setState(() {});
              },
              title: Text('Color secundario'),
            ),
            RadioListTile(
              value: 1,
              groupValue: _gender,
              onChanged: _setSelectedRadio,
              title: Text('Masculino'),
            ),
            RadioListTile(
              value: 2,
              groupValue: _gender,
              onChanged: _setSelectedRadio,
              title: Text('Femenino'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el teléfono',
                ),
                onChanged: (value) {
                  prefs.username = value;
                },
              ),
            )
          ],
        ));
  }

  void _setSelectedRadio(int value) {

    prefs.gender = value;
    setState(() {
      _gender = value;
    });
  }
}
