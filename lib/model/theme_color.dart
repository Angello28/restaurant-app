import 'dart:ui';
import 'package:flutter/material.dart';

class ThemeColor{
  final Color primaryColor;
  final Color backgroundColor;
  final Color textColor;

  ThemeColor({
    required this.primaryColor,
    required this.backgroundColor,
    required this.textColor
  });
}

ThemeColor lightTheme = ThemeColor(
  primaryColor: Color(0xFFFD6A02),
  backgroundColor: Colors.white,
  textColor: Color(0xFF292929)
);

ThemeColor darkTheme = ThemeColor(
    primaryColor: Color(0xFFFD6A02),
    backgroundColor: Color(0xFF292929),
    textColor: Colors.white
);

