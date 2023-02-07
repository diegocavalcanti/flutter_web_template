import 'package:flutter/material.dart';

ThemeData themeData(bool isLightTheme) {
  //ligth
  var primaryColorLight = Colors.blue;
  var secondaryColorLight = Colors.blueAccent;
  var tertiaryColorLight = Colors.blueGrey;

  //dark
  Map<int, Color> materialColorsBlack = {
    50: const Color(0xFF000000),
    100: const Color(0xFF000000),
    200: const Color(0xFF000000),
    300: const Color(0xFF000000),
    400: const Color(0xFF000000),
    500: const Color(0xFF000000),
    600: const Color(0xFF000000),
    700: const Color(0xFF000000),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  };

  var primaryColorDark = MaterialColor(0xFF337C36, materialColorsBlack);
  var secondaryColorDark = Colors.orange;
  var tertiaryColorDark = Colors.grey;

  return ThemeData(
    //useMaterial3: false,
    primaryColor: primaryColorLight,
    colorScheme: ColorScheme.fromSwatch(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      primarySwatch: isLightTheme ? primaryColorLight : primaryColorDark,
      primaryColorDark: primaryColorDark,
    ).copyWith(
      primary: isLightTheme ? primaryColorLight : primaryColorDark,
      secondary: isLightTheme ? secondaryColorLight : secondaryColorDark,
      tertiary: isLightTheme ? tertiaryColorLight : tertiaryColorDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    isLightTheme ? secondaryColorLight : secondaryColorDark)),
        labelStyle: TextStyle(
            color: isLightTheme ? secondaryColorLight : secondaryColorDark,
            fontSize: 16.0),
        iconColor: isLightTheme ? secondaryColorLight : secondaryColorDark,
        prefixIconColor:
            isLightTheme ? secondaryColorLight : secondaryColorDark,
        suffixIconColor:
            isLightTheme ? secondaryColorLight : secondaryColorDark),
  );
}
