import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const isDarkTheme = "isDarkTheme";

  void setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkTheme, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isDarkTheme) ?? false;
  }
}