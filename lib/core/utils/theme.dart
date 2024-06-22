import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 255, 255, 255),
    primary: Color.fromARGB(255, 62, 116, 100),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 120, 181, 161),
    scrim: Color.fromARGB(255, 231, 231, 231),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 0, 0, 0),
    primary: Color.fromARGB(255, 62, 116, 100),
    onPrimary: Color.fromARGB(255, 250, 250, 250),
    secondary: Color.fromARGB(255, 120, 181, 161),
    scrim: Color.fromARGB(255, 52, 57, 57),
  ),
);
















// ThemeData lightMode = ThemeData(
//   brightness: Brightness.light,
//   colorScheme: const ColorScheme.light(
//     background: Color.fromARGB(255, 255, 255, 255),
//     primary: Color.fromARGB(255, 120, 179, 161),
//     onPrimary: Color.fromARGB(255, 218, 218, 218),
//     secondary: Color.fromARGB(255, 88, 141, 126),
//     onSecondary: Color.fromARGB(255, 223, 223, 223),
//     surface: Color.fromARGB(255, 51, 51, 51),
//     onSurface: Color.fromARGB(255, 27, 27, 27),
//     shadow: Color.fromARGB(255, 114, 114, 114),
//     onTertiaryContainer: Color(0xff9E9E9E),
//   ),
// );

// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: const ColorScheme.dark(
//     background: Color.fromARGB(255, 0, 0, 0),
//     primary: Color.fromARGB(255, 62, 116, 100),
//     onPrimary: Color.fromARGB(255, 57, 57, 57),
//     secondary: Color.fromARGB(255, 120, 179, 161),
//     onSecondary: Color.fromARGB(255, 83, 83, 83),
//     surface: Color.fromARGB(255, 174, 174, 174),
//     onSurface: Color.fromARGB(255, 252, 252, 252),
//     shadow: Color(0xff212121),
//     onTertiary: Color.fromARGB(255, 0, 0, 0),
//   ),
// );
