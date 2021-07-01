import 'package:flutter/material.dart';

final theme = ThemeData(
    primaryColorDark: const Color(0xFF446418),
    primaryColorLight: const Color(0xFFc6e686),
    primaryColor: const Color(0xFF96b753),
    accentColor: const Color(0xFFbfc7a7),
    scaffoldBackgroundColor: const Color(0xFFE0F2F1),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
      backgroundColor: MaterialStateProperty.all(Color(0xFF446418)),
    )),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)));
