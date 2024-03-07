import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDark", value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isDark") ?? false;
  }
}
