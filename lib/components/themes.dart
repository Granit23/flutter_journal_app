// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final darkTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.black,
//   brightness: Brightness.dark,
//   backgroundColor: const Color(0xFF212121),
//   accentColor: Colors.white,
//   accentIconTheme: IconThemeData(color: Colors.black),
//   dividerColor: Colors.black12,
// );

// final lightTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.white,
//   brightness: Brightness.light,
//   backgroundColor: const Color(0xFFE5E5E5),
//   accentColor: Colors.black,
//   accentIconTheme: IconThemeData(color: Colors.white),
//   dividerColor: Colors.white54,
// );


// class ThemeNotifier with ChangeNotifier {
//   ThemeData _themeData;

//   ThemeNotifier(this._themeData);
//   bool isDarkMode = false;
//   getDarkMode() => this.isDarkMode;
//   getTheme() => _themeData;

//   setTheme(ThemeData themeData, [bool isDarkMode]) async {
//     this.isDarkMode = isDarkMode;
//     _themeData = themeData;
//     notifyListeners();
//   }
// }


// void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
//   (value)
//       ? themeNotifier.setTheme(darkTheme)
//       : themeNotifier.setTheme(lightTheme);
//   var prefs = await SharedPreferences.getInstance();
//   prefs.setBool('darkMode', value);
// }