import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  static bool _isNight = ThemeMode.system == ThemeMode.light ? false : true;
  ThemeMode currentTheme() {
    return _isNight ? ThemeMode.light : ThemeMode.dark;
  }

  void switcher() {
    _isNight = !_isNight;
    notifyListeners();
  }
}
