import 'package:flutter/material.dart';

final lightTheme =ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF0b233f),
    primaryColorDark: Color(0xFF00001a),
    primaryColorLight: Color(0xFF384a6a),
    buttonColor: Color(0xFFf7ce45),
    accentColor: Color(0xFFf7ce45),
    primarySwatch: Colors.amber // ?
  );

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF111316), //8% primary color i 92% #121212
    primaryColor: Color(0xFF111316),
    accentColor: Color(0xFF111316),
        buttonColor: Color(0xFFfadb7c),
        primarySwatch: MaterialColor(0xFFfadb7c,  {
      50:  const Color(0xFFfef7df),
      100: const Color(0xFFfce9af),
      200: const Color(0xFFfadb7c),
      300: const Color(0xFFf7ce45),
      400: const Color(0xFFf6c214),
      500: const Color(0xFFf5b700),
      600: const Color(0xFFf5aa00),
      700: const Color(0xFFf59700),
      800: const Color(0xFFf58600),
      900: const Color(0xFFf56500),
    }),

        );
