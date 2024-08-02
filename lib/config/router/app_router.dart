import 'package:pagos_en_linea_emi/presentation/screens/login_screen.dart';
import 'package:pagos_en_linea_emi/presentation/screens/pago_de_cuentas_screen.dart';
import 'package:pagos_en_linea_emi/presentation/screens/seleccionar_detalle_a_pagar.dart';
import 'package:pagos_en_linea_emi/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/pago_tigo_money.dart';
import 'package:pagos_en_linea_emi/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/pago_bcp.dart';
import 'package:pagos_en_linea_emi/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/pago_qr.dart';
import 'package:pagos_en_linea_emi/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/pago_visa.dart';
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
      return SeleccionarDetalleScreen.path;
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
      builder: (context, state) => const PagoCuentasScreen(totalMonto: 0.0,totalDescuento: 0.0,monto: 0.0,selectedItems: [],),
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
      builder: (context, state) => const PagoQrScreen(),)
  ],
);

static Future<bool> _checkToken()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? auhtToken = prefs.getString('token');

  if (auhtToken == null) return false;
  return true;

}
}
