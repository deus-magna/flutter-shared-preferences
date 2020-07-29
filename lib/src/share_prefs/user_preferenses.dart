

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {



  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {

    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de genero
  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender( int value ) {
    _prefs.setInt('gender', value);
  }

  // GET y SET de genero
  get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor( bool value ) {
    _prefs.setBool('secondaryColor', value);
  }

  // GET y SET de genero
  get username {
    return _prefs.getString('username') ?? '';
  }

  set username( String value ) {
    _prefs.setString('username', value);
  }

  // GET y SET de la ultima pagina
  get lastScreen {
    return _prefs.getString('lastScreen') ?? 'home';
  }

  set lastScreen( String value ) {
    _prefs.setString('lastScreen', value);
  }

}