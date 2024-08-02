import 'package:pagos_en_linea_emi/config/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  //  Logica para nuestro provider

  bool _isDark  = false;

  bool get isDark => _isDark;

  ThemeData get currentTheme => AppTheme().theme(isDark);

  void changeTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }
}