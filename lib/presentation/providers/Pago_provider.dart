import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/buscar_estudiante_provider.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/counters.dart';


class PagoService {
  final Dio _dio = Dio();
  

  Future<void> enviarDatos(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final countServi = CountersServices();
    String token = prefs.getString('token') ?? '';
    String cuf = _generarCUF();
    String fechaPago = _obtenerFechaActual();
    String? valCi;
    String? valRS;
    String? valNit;
    String? valCodUni;
    
    
    final buscarEstudianteProvider = Provider.of<BucarEstudianteProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    valNit = buscarEstudianteProvider.nit;
    valCodUni = buscarEstudianteProvider.codUni;
    if (buscarEstudianteProvider.valueCarnet == null) {
      valCi = buscarEstudianteProvider.ci;
    } else {
      valCi = buscarEstudianteProvider.valueCarnet;
    }

    if (buscarEstudianteProvider.valueRSocial == null) {
      valRS = buscarEstudianteProvider.ciNit;
    } else {
      valRS = buscarEstudianteProvider.valueRSocial;
    }

    List<Map<String, dynamic>> mapCog = buscarEstudianteProvider.codigoSelect.map((codigo) {
      return {"codigopago": codigo};
    }).toList();

    int countAct = await countServi.obtenerGet();

    Map<String, dynamic> data = {
      "cuf": cuf,
      "numero": countAct,
      "fechapago": fechaPago,
      "ci": valCi,
      "nit": valNit,
      "razonsocial": valRS,
      "coduni": valCodUni,
      "cantpagos": buscarEstudianteProvider.selectedItems.length,
      "codigopago": mapCog
    };
    print(data);

    final headers = {
      'token': token,
      'Content-Type': 'application/json',
    };

    try {
      final response = await _dio.post(
        'http://test.emi.edu.bo/pago',
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
         countServi.incrementCounter();
        _mostrarDialogo(context, 'Pago exitoso', 'Aceptar', true, (){buscarEstudianteProvider.listaPagosPendientes.clear();authProvider.logOut(context);});
      } else {
        _mostrarDialogo(context, 'Error ${response.statusCode}: ${response.statusMessage}', 'Intentar de nuevo', false,(){context.pop();});
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          if (e.response!.statusCode == 400) {
            _mostrarDialogo(context, 'Solicitud incorrecta', 'Intentar de nuevo', false,(){context.pop();});
          } else if (e.response!.statusCode == 500) {
            _mostrarDialogo(context, 'Error interno del servidor', 'Intentar de nuevo', false,(){context.pop();});
          } else {
            _mostrarDialogo(context, 'Error ${e.response!.statusCode}: ${e.response!.statusMessage}', 'Intentar de nuevo', false,(){context.pop();});
          }
        } else {
          _mostrarDialogo(context, 'Error al enviar los datos: $e', 'Intentar de nuevo', false,(){context.pop();});
        }
      } else {
        _mostrarDialogo( context, 'Error al enviar los datos: $e', 'Intentar de nuevo', false,(){context.pop();});
      }
    }
  }

  String _generarCUF() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789*-+-./,?¡¿';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(64, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  String _obtenerFechaActual() {
    final now = DateTime.now();
    return '${now.day}/${now.month}/${now.year}';
  }

  void _mostrarDialogo(BuildContext context, String mensaje, String textoBoton, bool exito, Function() onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: Text(textoBoton),
              onPressed: onPressed               
            ),
          ],
        );
      },
    );
  }
}

