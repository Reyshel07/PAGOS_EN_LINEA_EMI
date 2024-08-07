import 'package:flutter/material.dart';
import 'package:pagos_en_linea_emi/utils/asset_image_app.dart';

class OptionsScreen extends StatelessWidget {
  static const name = 'OptionsScreen';
  static const paht = '/OptionsScreen';
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double containerSize = screenSize.height * 0.3;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double imgSize = screenSize.width * 0.4;
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            Positioned(
              top:  -containerSize / 2,
              left: -containerSize / 2,
              child: Transform.rotate(
                angle: -90 / 115,
                child: Container(
                  height: containerSize,
                  width: containerSize,
                  color: Color.fromARGB(255, 12, 68, 114),
                ),
              )
            ),
            Positioned(
              top:  -containerSize / 2,
              left: -containerSize / 8,
              child: Transform.rotate(
                angle: -250 / 108,
                child: Container(
                  height: containerSize * 6,
                  width: containerSize * 0.8,
                  color: Color.fromRGBO(255, 230, 5, 1),
                ),
              )
            ),
            Positioned(
              bottom:  -containerSize / 2,
              right: -containerSize / 2,
              child: Transform.rotate(
                angle: -90 / 115,
                child: Container(
                  height: containerSize,
                  width: containerSize,
                  color: Color.fromARGB(255, 12, 68, 114),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: topPadding * 0.15),
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        SizedBox(height: smallSpacing * 5,),              
                        Image.asset(AssetImageApp.getLogo, width: imgSize * 1.3,),
                        SizedBox(
                          width: containerSize * 2,
                          child: Text('ESCUELA MILITAR DE INGENIERIA', style:  TextStyle(fontSize: letterSize * 0.038, fontWeight: FontWeight.bold,))
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: smallSpacing,),
                              Container(
                                width: containerSize * 0.6,
                                height: containerSize *0.6,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 12, 68, 114),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.credit_card,
                                      color: Colors.black,
                                      size: smallSpacing * 6,
                                    ),
                                    Text(
                                      'PAGO EMI', 
                                      style: TextStyle(
                                        fontSize: letterSize * 0.020, 
                                        color: Color.fromRGBO(255, 230, 5, 1),
                                        fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: smallSpacing,),
                              Container(
                                width: containerSize * 0.6,
                                height: containerSize *0.6,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 12, 68, 114),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.history_edu_outlined,
                                      color: Colors.black,
                                      size: smallSpacing * 6,
                                    ),
                                    Text(
                                      'HISTORIAL DE PAGOS', 
                                      style: TextStyle(
                                        fontSize: letterSize * 0.020, 
                                        fontWeight: FontWeight.bold, 
                                        color: Color.fromRGBO(255, 230, 5, 1),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: smallSpacing,),
                              Container(
                                width: containerSize * 0.6,
                                height: containerSize * 0.6,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 12, 68, 114),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                  
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.list_alt,
                                      color: Colors.black,
                                      size: smallSpacing * 6,
                                    ),
                                    Text(
                                      'HISTORIAL DE NOTAS', 
                                      style: TextStyle(
                                        fontSize: letterSize * 0.020,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(255, 230, 5, 1),
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}