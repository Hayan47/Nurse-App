import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool isDarkTheme = false;

  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffEE4E34),
        actionsIconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontFamily: 'Shantell',
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xffFCEDDA),
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      cardColor: Colors.white,
      hintColor: Colors.black,
      shadowColor: Colors.grey.shade700,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontFamily: 'Shantell', fontSize: 16, color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        actionsIconTheme: const IconThemeData(color: Color(0xffEE4E34)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xffEE4E34)),
        titleTextStyle: const TextStyle(
          fontFamily: 'Shantell',
          fontSize: 25,
          color: Color(0xffEE4E34),
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: Colors.black,
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      cardColor: Colors.grey.shade800,
      hintColor: Colors.white,
      shadowColor: Colors.white70,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontFamily: 'Shantell', fontSize: 16, color: Colors.white),
      ),
    );
  }
}
