import 'package:flutter/material.dart';

ThemeData themeData(bool isDarkTheme) {
  //ligth
  var primaryColorLight = Color.fromARGB(255, 224, 226, 227);
  var secondaryColorLight = Colors.blueGrey;
  var tertiaryColorLight = Colors.black;
  var inversePrimaryColorLight = Colors.black;

  //dark

  var primaryColorDark = const Color.fromARGB(255, 18, 34, 59);
  var secondaryColorDark = const Color.fromARGB(255, 153, 71, 194);
  var tertiaryColorDark = Colors.white;
  var inversePrimaryColorDark = Colors.white;

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: isDarkTheme ? primaryColorDark : primaryColorLight,
          inversePrimary:
              isDarkTheme ? inversePrimaryColorDark : inversePrimaryColorLight,
          secondary: isDarkTheme ? secondaryColorDark : secondaryColorLight,
          tertiary: isDarkTheme ? tertiaryColorDark : tertiaryColorLight,
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          background: isDarkTheme ? Colors.black : Colors.white,
        ),
    cardColor: isDarkTheme ? primaryColorDark : primaryColorLight,
    canvasColor: isDarkTheme ? Colors.black : Colors.white,
    appBarTheme: AppBarTheme(
        foregroundColor:
            isDarkTheme ? inversePrimaryColorDark : inversePrimaryColorLight,
        iconTheme: IconThemeData(
            color: isDarkTheme
                ? inversePrimaryColorDark
                : inversePrimaryColorLight),
        color: isDarkTheme ? primaryColorDark : primaryColorLight),
  );
}
