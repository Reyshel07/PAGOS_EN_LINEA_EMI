import 'package:pagos_en_linea_emi/presentation/screens/login/login_screen.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/historial_notas/note_history.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/historial_pagos/payment_history.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/options_screen.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/select_detail_screen/payment_method_screen/pago_de_cuentas_screen.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/select_detail_screen/payment_method_screen/widgets_pago/payment_methods_screen/pago_bcp.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/select_detail_screen/payment_method_screen/widgets_pago/payment_methods_screen/pago_qr.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/select_detail_screen/payment_method_screen/widgets_pago/payment_methods_screen/pago_tigo_money.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/select_detail_screen/payment_method_screen/widgets_pago/payment_methods_screen/pago_visa.dart';
import 'package:pagos_en_linea_emi/presentation/screens/options_screen/select_detail_screen/seleccionar_detalle_a_pagar.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  static final appRouter = GoRouter(
  initialLocation: LoginScreen.paht,
  redirect:  (context, state) async{
    final bool isAuth = await _checkToken();
    final bool pagoCuenta =state.matchedLocation == PagoCuentasScreen.path;

    

    if (pagoCuenta == true) return PagoCuentasScreen.path;
    

    if(!isAuth){
      return LoginScreen.paht;
    }else{
      return OptionsScreen.paht;
    }
    
  },
  routes: [
    GoRoute(
      path:  LoginScreen.paht,
      name:  LoginScreen.name,
      builder: (context, state) =>  const LoginScreen(),
    ),
    GoRoute(
      path: SeleccionarDetalleScreen.path,
      name: SeleccionarDetalleScreen.name,
      builder: (context, state) => const SeleccionarDetalleScreen(),
    ),
     GoRoute(
      path: PagoCuentasScreen.path,
      name: PagoCuentasScreen.name,
      builder: (context, state) => PagoCuentasScreen(totalMonto: 0.0,totalDescuento: 0.0,monto: 0.0,selectedItems: const [],),
    ),
    GoRoute(
      path: PagoVisaScreen.path,
      name: PagoVisaScreen.name,
      builder: (context, state) => PagoVisaScreen(),
    ),
    GoRoute(
      path: PagoBcpScreen.path,
      name: PagoBcpScreen.name,
      builder: (context, state) => PagoBcpScreen(),
    ),
    GoRoute(
      path: PagoTigoMoneyScreen.path,
      name: PagoTigoMoneyScreen.name,
      builder: (context, state) => PagoTigoMoneyScreen(),
    ),
    GoRoute(
      path: PagoQrScreen.path,
      name: PagoQrScreen.name,
      builder: (context, state) => const PagoQrScreen(),
    ),
    GoRoute(
      path: OptionsScreen.paht,
      name: OptionsScreen.name,
      builder: (context, state) => const OptionsScreen(),
    ),
    GoRoute(
      path: NoteHistoryScreen.paht,
      name: NoteHistoryScreen.name,
      builder: (context, state) => const NoteHistoryScreen(),
    ),
    GoRoute(
      path: PaymentHistoryScreen.path,
      name: PaymentHistoryScreen.name,
      builder: (context, state) => const PaymentHistoryScreen(),
    ),
  ],
);

static Future<bool> _checkToken()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? auhtToken = prefs.getString('token');

  if (auhtToken == null) return false;
  return true;

}
}
