import 'package:pagos_en_linea_emi/config/theme/extension_theme.dart';
import 'package:pagos_en_linea_emi/presentation/providers/buscar_estudiante_provider.dart';
import 'package:pagos_en_linea_emi/presentation/providers/theme_provider.dart';
import 'package:pagos_en_linea_emi/presentation/screens/login/login_screen.dart';
import 'package:pagos_en_linea_emi/presentation/screens/payment_method_screen/pago_de_cuentas_screen.dart';
import 'package:pagos_en_linea_emi/presentation/widgets/custom_table_widget.dart';
import 'package:pagos_en_linea_emi/utils/asset_image_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeleccionarDetalleScreen extends StatefulWidget {
  static const name = 'seleccionar-detalle';
  static const path = '/seleccionar-detalle'; 
  const SeleccionarDetalleScreen ({super.key});

  @override
  State<SeleccionarDetalleScreen> createState() =>
      _SeleccionarDetalleScreenState();
}

class _SeleccionarDetalleScreenState extends State<SeleccionarDetalleScreen> {
  @override 
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final bucarEstudianteProvider = Provider.of<BuscarEstudianteProvider>(context, listen: false);

       bucarEstudianteProvider.listData(context);
       Future.delayed(const Duration(minutes: 10),(){
         context.go(LoginScreen.paht);
         prefs.clear();
       });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final buscarEstudianteProvider =Provider.of<BuscarEstudianteProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double smallSpacing = screenSize.height * 0.02;
    final double broadSpacing = screenSize.width * 0.02;
    final double letterSize = screenSize.height ;
    final double imgSize = screenSize.width * 0.4;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.darkBlue,
        actions: [
          IconButton(
            onPressed: (){
              
              themeProvider.changeTheme();
            }, 
            icon:  Icon( themeProvider.isDark ? Icons.light_mode : Icons.dark_mode ),
          ),          
        ],
        leading: IconButton(
          onPressed: () {
            buscarEstudianteProvider.listaPagosPendientes.clear();
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: broadSpacing * 27,
                    child: Text(
                      'PAGOS EN LINEA EMI',
                      style: TextStyle(
                        fontSize: letterSize * 0.03,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Image.asset(AssetImageApp.getLogo, width: imgSize *0.5),
                ],
              ),   
              SizedBox(
                height: smallSpacing,
              ),
              Text(
                'Paga tus cuentas',
                style: TextStyle(
                  letterSpacing: 0.2,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: letterSize * 0.02,
                ),
              ),
              SizedBox(
                height: smallSpacing,
              ),
              Row(
                children: [
                  Text(
                    'Detalles de tu cuenta',
                    style: TextStyle(
                      letterSpacing: 0.2,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: letterSize * 0.02,
                    ),
                  ),
                  const Spacer(),
                  Consumer<BuscarEstudianteProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton(
                        onPressed: provider.hasSelectedItems
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PagoCuentasScreen(
                                      totalMonto: provider.totalMonto,
                                      selectedItems: provider.itemsSelectedByUser,
                                      totalDescuento: provider.totalDescuento,
                                      monto: provider.monto,
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Pagar', style: TextStyle(color: Colors.white, fontSize: letterSize * 0.018),),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: smallSpacing,
              ),
              Row(
                children: [
                  Text(
                    'Detalle:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: letterSize * 0.016,
                    ),
                  ),
                  SizedBox(
                    width: broadSpacing,
                  ),
                  Text('Ciencias Basicas|', style: TextStyle(fontSize: letterSize * 0.016),),
                  Text(
                    buscarEstudianteProvider.unidadAcademica,
                    style: TextStyle(fontSize: letterSize * 0.016),
                  ),
                ],
              ),
              SizedBox(
                height: smallSpacing,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'CI:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: letterSize * 0.016,
                    ),
                  ),
                  SizedBox(
                    width: broadSpacing,
                  ),
                  Text(
                    buscarEstudianteProvider.ci,
                    style: TextStyle(fontSize: letterSize * 0.016),
                  ),
                  SizedBox(
                    width: broadSpacing * 5,
                  ),
                  Text(
                    'Nombre:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: letterSize *0.016,
                    ),
                  ),
                  SizedBox(
                    width: broadSpacing,
                  ),
                  Text(
                    buscarEstudianteProvider.nombres,
                    style: TextStyle(fontSize: letterSize * 0.016),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: buscarEstudianteProvider.listaPagosPendientes.length,
                  itemBuilder: (context, index) {
                    final item = buscarEstudianteProvider.listaPagosPendientes[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: topPadding * 0.10),
                      child: CustomTable(
                        numeral: '# 000 ${index + 1}',
                        titleDetalle: 'Detalle:',
                        contentDetalle: item.item,
                        titleMonto: 'Monto:',
                        contentMonto: '${item.montototal}',
                        titlecodigo: 'Cuenta:',
                        contentcodigo: item.codigopago,
                        children: [
                          Text('Seleccionar', style: TextStyle(fontSize: letterSize * 0.018),),
                           Checkbox(
                            value: buscarEstudianteProvider.selectedItems.contains(item.codigopago),
                            onChanged: (bool? value) {
                              buscarEstudianteProvider.onCheckboxChanged(value, item.codigopago, context);
                              buscarEstudianteProvider.itemSelected(item, context);
                            },
                            checkColor: Colors.white,
                            activeColor: const Color.fromARGB(255, 12, 68, 114),
                          )
                        ]
                      )
                    );
                  }
                )
              )
            ]
          )
        )
      );
  }
}

