import 'package:shared_preferences/shared_preferences.dart';

import '../enums.dart';

class DarkModePreference {
  static const darkModeKey = 'dark_mode_status';

  setMode(DarkMode darkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(darkModeKey, darkMode.toString());
  }

  Future<DarkMode> getMode() async {
    final prefs = await SharedPreferences.getInstance();
    final resultMode = prefs.getString(darkModeKey);

    return DarkMode.values.firstWhere(
      (element) => element.toString() == resultMode,
      orElse: () => DarkMode.off,
    );
  }
}
