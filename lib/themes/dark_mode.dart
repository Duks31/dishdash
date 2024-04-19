import "package:flutter/material.dart";

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 20, 20, 20), 
    primary: const Color.fromARGB(255, 122, 122, 122), 
    secondary: const Color.fromARGB(255, 30, 30, 30), 
    tertiary: const Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade700,
  ),
);


// import 'package:flutter/material.dart';

// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: ColorScheme.dark(
//     background: Colors.grey.shade900, 
//     primary: Colors.green.shade400, 
//     secondary: Colors.green.shade600, 
//     tertiary: Colors.grey.shade800,
//     surface: Colors.grey.shade700,
//     onBackground: Colors.white,
//     onPrimary: Colors.black,
//     onSecondary: Colors.black,
//     onSurface: Colors.white,
//   ),
// );