import 'package:flutter/cupertino.dart';

import '../local_storage/dark_mode_preference.dart';
import '../enums.dart';

class DarkModeProvider extends ChangeNotifier {
  final _darkModePreference = DarkModePreference();

  DarkModeProvider() {
    init();
  }

  void init() async {
    _default = await _darkModePreference.getMode();
  }

  DarkMode _default = DarkMode.off;

  DarkMode get value => _default;

  set value(DarkMode value) {
    _default = value;
    _darkModePreference.setMode(value);
    notifyListeners();
  }
}
