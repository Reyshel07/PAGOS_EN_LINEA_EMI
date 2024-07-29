/*import 'package:PAGOS_EN_LINIA_EMI/models/buscador_api.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/screens/seleccionar_detalle_a_pagar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BucarEstudianteProvider extends ChangeNotifier {
  final dio = Dio();
  String baseURL = 'https://test.emi.edu.bo';

  List<Item> listaPagosPendientes = [];
  List<String> selectedItems = [];
  String ci = '';
  String nombres = '';
  String unidadAcademica = '';
  double totalMonto = 0.0;
  String ciNit = '';
  String correo = '';

  BucarEstudianteProvider() {
    selectedItems = [];
  }

  Future<bool> searchIDUser(String idUser, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('idUser', idUser);

    String token = prefs.getString('token') ?? '';

    final data = {
      "cliente": idUser,
      "searchCode": 1
    };
    final headers = {
      'token': token,
      'content-Type': 'application/json',
    };

    try {
      final response = await dio.post(
        '$baseURL/buscador',
        data: data,
        options: Options(headers: headers)
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Usuario no encontrado"),
              content: const Text('Volver a ingresar el CI o Codigo correcto'),
              actions: [
                TextButton(
                  onPressed: () { context.pop(); },
                  child: const Text("Volver a intentar")
                )
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text('Error en la búsqueda: ${e.message}'),
              actions: [
                TextButton(
                  onPressed: () { context.pop(); },
                  child: const Text("Cerrar")
                )
              ],
            );
          },
        );
      }
      return false;
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text('Error inesperado: $e'),
            actions: [
              TextButton(
                onPressed: () { context.pop(); },
                child: const Text("Cerrar")
              )
            ],
          );
        },
      );
      return false;
    }
  }

  Future<void> llenarDatosUsuario(String idUser, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final data = {
      "cliente": idUser,
      "searchCode": 1
    };
    final headers = {
      'token': token,
      'content-Type': 'application/json',
    };

    try {
      final response = await dio.post(
        '$baseURL/buscador',
        data: data,
        options: Options(headers: headers)
      );

      final res = BuscadorPagosPendientes.fromJson(response.data);

      // Limpia la lista antes de agregar nuevos elementos
      listaPagosPendientes.clear();
      listaPagosPendientes.addAll(res.items);
      notifyListeners();

      ci = res.cliente.ci;
      nombres = res.cliente.nombres;
      unidadAcademica = res.cliente.unidadAcademica;
      ciNit = res.cliente.paterno;
      correo = res.cliente.eMail;

      context.go(SeleccionarDetalleScreen.path);

    } on DioException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text('Error al llenar datos: ${e.message}'),
            actions: [
              TextButton(
                onPressed: () { context.pop(); },
                child: const Text("Cerrar")
              )
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text('Error inesperado: $e'),
            actions: [
              TextButton(
                onPressed: () { context.pop(); },
                child: const Text("Cerrar")
              )
            ],
          );
        },
      );
    }
  }

  void onCheckboxChanged(bool? value, String codigoPago) {
    final item = getItemPorCodigoPAgo(codigoPago);

    if (item != null) {
      if (value == true) {
        selectedItems.add(codigoPago);
        totalMonto += item.montototal;
      } else {
        selectedItems.remove(codigoPago);
        totalMonto -= item.montototal;
      }

      notifyListeners();
    }
  }

  Item? getItemPorCodigoPAgo(String codigoPago) {
    try {
      return listaPagosPendientes.firstWhere((item) => item.codigopago == codigoPago);
    } catch (e) {
      return null;
    }
  }

  final List<Item> itemsSelectedByUser = [];

  void itemSelected(Item item) {
    if (itemsSelectedByUser.contains(item)) {
      itemsSelectedByUser.remove(item);
    } else {
      itemsSelectedByUser.add(item);
    }

    print(item.item);

    notifyListeners();
  }
}*/

export '';
