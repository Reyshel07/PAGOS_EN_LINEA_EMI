import 'package:pagos_en_linea_emi/config/theme/extension_theme.dart';
import 'package:pagos_en_linea_emi/presentation/providers/pago_provider.dart';
import 'package:pagos_en_linea_emi/utils/asset_image_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PagoTigoMoneyScreen extends StatelessWidget {
  final PagoService pagoService = PagoService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const name = 'pago-tigo-money';
  static const path = '/pago-tigo-money';
  PagoTigoMoneyScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double smallSpacing = screenSize.height * 0.02;
    final double broadSpacing = screenSize.width * 0.02;
    final double letterSize = screenSize.height;
    final double imgSize = screenSize.width * 0.5;
    final double image = screenSize.height * 0.5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.darkBlue,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: Container(
                  width: screenSize.width * 0.95,
                  height: screenSize.height * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(smallSpacing * 0.5),
                      child: Container(
                        height: screenSize.height * 0.05,
                        width: screenSize.width * 3,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.black12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: broadSpacing),
                            Column(
                              children: [
                                SizedBox(
                                    height: screenSize.height * 0.01,
                                    width: screenSize.width * 0.01),
                                CircleAvatar(                                  
                                  maxRadius: screenSize.height * 0.012,
                                  minRadius: screenSize.height * 0.012,
                                  backgroundColor: Colors.black54,
                                  child: Text('3', style: TextStyle(fontSize: letterSize * 0.01),),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenSize.height * 0.005,
                            ),
                            Text('Seleccione tu forma de pago',
                              style: TextStyle(
                                  fontSize: letterSize * 0.015,
                                  fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(topPadding * 0.10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Tigo Money',
                                style: TextStyle(
                                    fontSize: letterSize * 0.015,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(AssetImageApp.gettigoMoney,
                                  width: imgSize * 0.5, height: image * 0.11)
                            ],
                          ),
                          const Text('Ingresa tu número de celular Tigo Money'),
                          SizedBox(height: smallSpacing * 1),
                          SizedBox(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            child:TextFormField(   
                              style: TextStyle(fontSize: letterSize * 0.015),                 
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Requerido*';
                                }
                                return null;
                              },
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: 'Numero de documento*',
                                hintStyle: TextStyle(
                                  fontSize: letterSize * 0.015,
                                ),
                                errorStyle: TextStyle(
                                  fontSize: letterSize * 0.015, 
                                  color: Colors.red.shade800, 
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade800, 
                                    width: screenSize.width * 0.005,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade800, 
                                    width: screenSize.width * 0.005, 
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: smallSpacing,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 12, 68, 114)),
                            child: Padding(
                              padding: EdgeInsets.all(topPadding * 0.15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tipo de cambio: 6.96',
                                    style: TextStyle(
                                      fontSize: letterSize * 0.015,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    'Instrucciones:',
                                    style: TextStyle(
                                      fontSize: letterSize * 0.015,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    )
                                  ),
                                  Text(
                                    '1.-Ingresa tu nuemro de celular',
                                    style: TextStyle(
                                      fontSize: letterSize * 0.015,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    )
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.6,
                                    child: Text(
                                      '2.-Recibirás una solicitud en tu celular, para ingresar tu PIN Tigo',
                                      style: TextStyle(
                                      fontSize: letterSize * 0.015,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.6,
                                    child: Text(
                                        '3.- ¡Listo!, recibirás una notificacion de pago',
                                        style: TextStyle(
                                        fontSize: letterSize * 0.015,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: smallSpacing,),
                          SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {                                    
                                    if(_formKey.currentState?.validate()?? false){    
                                      pagoService.enviarDatos(context);                                                                       
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.yellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    'Realizar Pago',
                                    style: TextStyle(
                                        color: const Color.fromARGB(255, 12, 68, 114),
                                        fontSize: letterSize * 0.020,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                    )
                  ]
                )
              )
            ),
          ],
        ),
      )
    );
  }
}
