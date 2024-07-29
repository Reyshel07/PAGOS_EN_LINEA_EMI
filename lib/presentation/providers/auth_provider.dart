import 'package:PAGOS_EN_LINIA_EMI/models/login_response.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/screens/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {

  final dio = Dio();
  String basaURL = 'https://test.emi.edu.bo';

  login(String username, String password) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await dio.post(
      "$basaURL/iniciarsesion",
      data:{
        "username": username,
        "password": password
      },
      options:  Options(
        headers: {

        }
      )
    );

    if(response.statusCode == 200){
      final res = LoginResponse.fromJson(response.data);
      prefs.setString('token', res.token);
    }

  }

  logOut(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    context.go(LoginScreen.paht); 
    prefs.clear();
  }
}
