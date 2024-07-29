import 'package:PAGOS_EN_LINIA_EMI/config/theme/extension_theme.dart';
import 'package:PAGOS_EN_LINIA_EMI/models/buscador_api.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/Pago_provider.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/buscar_estudiante_provider.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/widgets/pago_screens.dart/datos_envio.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/widgets/pago_screens.dart/forma_pago.dart';
import 'package:PAGOS_EN_LINIA_EMI/utils/asset_image_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/widgets/pago_screens.dart/detalles_pago.dart';
import 'package:provider/provider.dart';

class PagoCuentasScreen extends StatelessWidget {
  
  static const name = 'pago-cuentas';
  static const path = '/pago-cuentas';

  final double totalMonto;
  final List<Item> selectedItems;
  final double totalDescuento;
  final double monto;
  final PagoService pagoService = PagoService();
 

  PagoCuentasScreen({
  Key? key, 
  required this.totalMonto, 
  required this.selectedItems, 
  required this.totalDescuento,
  required this.monto }):super(key: key);
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController ciController = TextEditingController();
  final TextEditingController razonSocialController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    final buscarEstudianteProvider =Provider.of<BucarEstudianteProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double imgSize = screenSize.width * 0.5;
    final double image = screenSize.height * 0.5;
    final double smallSpacing = screenSize.height * 0.02;
    final double broadSpacing = screenSize.width * 0.02;
    final double letterSize = screenSize.height;

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.darkBlue,
        leading: IconButton(
          onPressed: () {
            buscarEstudianteProvider.resetData();
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: broadSpacing * 25,
                  child: Text(
                    'PAGOS EN LINEA EMI',
                    style: TextStyle(
                      fontSize: letterSize * 0.030,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Image.asset(AssetImageApp.getLogo, width: imgSize * 0.5),
              ],
            ),
            SizedBox( height: smallSpacing,),          
            Text('Paga tus cuentas',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: letterSize *0.018)
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      detallespago(
                        topPadding: topPadding, screenSize: screenSize, 
                        smallSpacing: smallSpacing, letterSize: letterSize, 
                        broadSpacing: broadSpacing,totalMonto: totalMonto, 
                        selectedItems: selectedItems,totalDescuento: totalDescuento ,
                        monto: monto),
                      datosenvio(
                        topPadding: topPadding, 
                        screenSize: screenSize, 
                        smallSpacing: smallSpacing, 
                        broadSpacing: broadSpacing, 
                        letterSize: letterSize, 
                        buscarEstudianteProvider: buscarEstudianteProvider, 
                        formKey: _formKey, valueCi: buscarEstudianteProvider.ci, 
                        valueRazonSocial: buscarEstudianteProvider.ciNit, 
                        valueCorreo: buscarEstudianteProvider.correo,
                        ),
                      formapago(
                        topPadding: topPadding, screenSize: screenSize, 
                        smallSpacing: smallSpacing, broadSpacing: broadSpacing, 
                        letterSize: letterSize, imgSize: imgSize, image: image, 
                        formKey: _formKey, buscarEstudianteProvider: buscarEstudianteProvider,
                        ),
                    ],
                  ),
                ],
              )
            ), 
          ],
        ),
      ),
    );
  }
}