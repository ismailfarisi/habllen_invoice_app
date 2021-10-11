import 'package:flutter/material.dart';

final theme = ThemeData(
    primaryColorDark: const Color(0xFF446418),
    primaryColorLight: const Color(0xFFc6e686),
    primaryColor: const Color(0xFF96b753),
    accentColor: const Color(0xFFbfc7a7),
    scaffoldBackgroundColor: const Color(0xFFE0F2F1),
    appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFE0F2F1),
        titleTextStyle: TextStyle(
            fontSize: 24,
            color: const Color(0xFFc6e686),
            fontWeight: FontWeight.bold)),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xFF446418)),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Color(0xFF446418)))),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF446418))));
