import 'package:pagos_en_linea_emi/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pagos_en_linea_emi/presentation/screens/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final dio = Dio();
  String baseURL = 'https://test1.emi.edu.bo';

  Future<void> login(String username, String password, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    try {
      final response = await dio.post(
        "$baseURL/iniciarsesion",
        data: {
          "username": username,
          "password": password,
        },
        options: Options(
          headers: {
            
          },
        ),
      );

      if (response.statusCode == 200) {
        final res = LoginResponse.fromJson(response.data);
        prefs.setString('token', res.token);
      } else {
        _showError(context, 'Error al iniciar sesión. Código: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout || e.type == DioErrorType.receiveTimeout) {
        _showError(context, 'Tiempo de espera agotado. Por favor, intente nuevamente.');
      } else {
        _showError(context, 'Error al conectar con el servidor. Por favor, intente nuevamente.');
      }
    } catch (e) {
      _showError(context, 'Ocurrió un error inesperado. Por favor, intente nuevamente.');
    }
  }

  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    context.go(LoginScreen.paht);
    prefs.clear();
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center,),
        backgroundColor: Colors.red,
      ),
    );
  }
}

