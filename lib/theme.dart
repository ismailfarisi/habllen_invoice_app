import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: const Color(0xFF96b753),
  colorScheme: ColorScheme(
    primary: const Color(0xFF96b753),
    primaryVariant: const Color(0xFF446418),
    secondary: const Color(0xFF558B6E),
    secondaryVariant: const Color(0xFF9AC1AC),
    surface: const Color(0xFF9AC1AC),
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.black,
    brightness: Brightness.light,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: const Color(0xFF446418),
  ),
);
