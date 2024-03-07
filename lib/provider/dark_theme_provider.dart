import 'package:associatemember/service/dark_theme_prefs.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs themePrefs = DarkThemePrefs();

  bool isDark = false;

  bool get getDarkTheme => isDark;

  set SetDarkTheme(bool value) {
    isDark = value;
    themePrefs.setTheme(value);
    notifyListeners();
  }
}
