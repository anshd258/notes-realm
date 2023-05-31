import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const uniquekey = "_key";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(uniquekey, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(uniquekey) ?? false;
  }
}