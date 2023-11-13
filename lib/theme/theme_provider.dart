import 'package:flutter/material.dart';
import 'package:frontend/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  static const String themePreferenceKey = 'theme_preference';

  ThemeProvider() {
    loadThemePreference();
  }

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    saveThemePreference();
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  Future<void> loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(themePreferenceKey);

    if (savedTheme == 'light') {
      themeData = lightMode;
    } else {
      themeData = darkMode;
    }
  }

  Future<void> saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_themeData == lightMode) {
      prefs.setString(themePreferenceKey, 'light');
    } else {
      prefs.setString(themePreferenceKey, 'dark');
    }
  }
}
