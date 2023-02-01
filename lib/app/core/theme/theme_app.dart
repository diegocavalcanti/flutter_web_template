import 'package:flutter/material.dart';

ThemeData themeData(bool isDarkTheme) {
  var primaryColor = Colors.indigo[30];
  var secondaryColor = Colors.indigo[30];

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor:
        isDarkTheme ? Color(0xFF00001a) : Color(0xFFFFFFFF),
    primaryColor: Colors.green,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: isDarkTheme ? Color.fromARGB(255, 27, 31, 53) : primaryColor,
          secondary:
              isDarkTheme ? const Color(0xFF1A1F3C) : const Color(0xFFFFFFFF),
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
    cardColor: isDarkTheme ? const Color(0xFF0a0d2c) : primaryColor,
    canvasColor: isDarkTheme ? Colors.black : Colors.white,
  );
}
