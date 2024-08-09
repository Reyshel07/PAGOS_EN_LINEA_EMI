import 'package:pagos_en_linea_emi/config/theme/extension_theme.dart';
import 'package:pagos_en_linea_emi/utils/asset_image_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PagoQrScreen extends StatelessWidget {
  static const name = 'pago-qr';
  static const path = '/pago-qr';
  const PagoQrScreen ({super.key});

  

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double smallSpacing = screenSize.height * 0.02;
    final double broadSpacing = screenSize.width * 0.02;
    final double letterSize = screenSize.height;

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
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.all(topPadding * 0.05),
            child: Container(
              width: screenSize.width * 0.95,
              height: screenSize.height * 0.8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(smallSpacing * 0.5),
                    child: Container(
                      height: screenSize.height * 0.05,
                      width: screenSize.width * 3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: const BorderRadius.all(Radius.circular(10)), 
                        color: Colors.black12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[   
                          SizedBox(width: broadSpacing),                     
                          Column(
                            children: [
                              SizedBox(height: screenSize.height * 0.01, width: screenSize.width * 0.01),
                              CircleAvatar (
                                maxRadius: screenSize.height * 0.012, 
                                minRadius: screenSize.height * 0.012, 
                                backgroundColor: Colors.black54,
                                child:  Text('3', style: TextStyle(fontSize: letterSize * 0.01))
                              ),
                            ],
                          ),
                          SizedBox(width: screenSize.height * 0.005,),
                          Text('Seleccione tu forma de pago', 
                          style: TextStyle(
                            fontSize: letterSize * 0.015,
                            fontWeight: FontWeight.bold
                            )
                          ),
                                                                      
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(topPadding * 0.10),
                  child: Column(
                    children: [
                      Text(
                        'Dédito bancario QR',
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold
                        ),
                      ),  
                      SizedBox(height: smallSpacing),                                             
                      Text(
                        'Escanea el código QR con la aplicación movil de tu entidad bancaria',
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 8,
                        height: smallSpacing * 15,
                        child: Image.asset(
                          AssetImageApp.getqr,
                          
                        ),
                      ),
                      SizedBox(height: smallSpacing * 1),  
                      Container(
                        width: screenSize.width * 0.8,
                        height: smallSpacing * 11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 12, 68, 114)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(topPadding * 0.10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Instrucciones:',
                                style: TextStyle(
                                  fontSize: letterSize * 0.015,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.5,
                                child: Text(
                                  '1.-Ingresa a tu banca movil, sección de pago con QR',
                                  style: TextStyle(
                                    fontSize: letterSize * 0.015,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width:  screenSize.width * 0.5,
                                child: Text(
                                  '2.-Escanea el código QR que se muestra en pantalla',
                                  style: TextStyle(
                                    fontSize: letterSize * 0.015,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                '3.- ¡Listo!, recibirás una notificacion de pago',
                                style: TextStyle(
                                  fontSize: letterSize * 0.015,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),)
                ]
              )
            )
          ),
        ],
      ),
    );
  }
}