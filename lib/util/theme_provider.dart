import 'package:flutter/material.dart';
import 'package:google_redesign/services/dark_theme_preference.dart';

class ThemeProvider with ChangeNotifier {

  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}