import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF96b753),
    colorScheme: ColorScheme(
      primary: const Color(0xFF96b753),
      primaryVariant: const Color(0xFF446418),
      secondary: const Color(0xFF558B6E),
      secondaryVariant: const Color(0xFF9AC1AC),
      surface: Colors.white,
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
    iconTheme: IconThemeData(size: 24.0));
final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF96b753),
    primarySwatch: Colors.teal,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.grey[700],
      foregroundColor: const Color(0xFF96b753),
    ),
    iconTheme: IconThemeData(size: 24.0));
