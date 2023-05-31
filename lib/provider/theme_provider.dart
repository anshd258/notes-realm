import 'package:flutter/material.dart';
import 'theme_pref.dart';

class AppTheme extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _preferences;
  bool get isDark => _isDark;

  AppTheme() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}