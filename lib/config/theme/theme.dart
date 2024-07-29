import 'package:flutter/material.dart';

class AppTheme {

  ThemeData theme(bool isDark){
    return ThemeData(
      useMaterial3: true,
      colorScheme: isDark ? _darkTheme : _lightTheme,
    );
  }

  final ColorScheme _darkTheme = const ColorScheme.dark();
  final ColorScheme _lightTheme = const ColorScheme.light();


}