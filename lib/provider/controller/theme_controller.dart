import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/prefs_keys.dart';
import 'package:flutter_application_2/main.dart';

class ThemeController with ChangeNotifier {
  late ThemeMode themeMode;

  void initTheme() {
    String theme = prefs.getString(PrefsKeys.theme) ?? ThemeMode.light.name;

    switch (theme) {
      case "light":
        themeMode = ThemeMode.light;
      case "dark":
        themeMode = ThemeMode.dark;
      case "system":
        themeMode = ThemeMode.system;
      default:
    }
  }

  Future<void> changeTheme(ThemeMode newMode) async {
    themeMode = newMode;
    await prefs.setString(PrefsKeys.theme, themeMode.name);
    notifyListeners();
  }
}
