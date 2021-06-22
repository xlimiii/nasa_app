import 'package:flutter/material.dart';
ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF0b233f),
    primaryColorDark: Color(0xFF00001a),
    primaryColorLight: Color(0xFF384a6a),
    buttonColor: Color(0xFFf6c114),
    accentColor: Color(0xFFf6c114),
    primarySwatch: Colors.amber // ?
  );
}

ThemeData darkTheme() {
  return ThemeData(
        );
}
