
import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/buscar_estudiante_provider.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/Pago_tigo_money.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/pago_bcp.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/pago_qr.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/widgets/pago_screens.dart/forma_pago_screen.dart/pago_visa.dart';
import 'package:PAGOS_EN_LINIA_EMI/utils/asset_image_app.dart';
import 'package:flutter/material.dart';

class formapago extends StatelessWidget {

  
  const formapago({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.topPadding,
    required this.screenSize,
    required this.smallSpacing,
    required this.broadSpacing,
    required this.letterSize,
    required this.imgSize,
    required this.image,
    required BucarEstudianteProvider buscarEstudianteProvider,
  }): _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final double topPadding;
  final Size screenSize;
  final double smallSpacing;
  final double broadSpacing;
  final double letterSize;
  final double imgSize;
  final double image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Padding(padding: EdgeInsets.only(top: topPadding * 0.05),
      child: Container(
        width: screenSize.width * 0.9,
        height: screenSize.height * 0.6,
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
                        CircleAvatar(child: Text('3', style: TextStyle(fontSize: letterSize * 0.01),), 
                        maxRadius: screenSize.height * 0.012, 
                        minRadius: screenSize.height * 0.012, 
                        backgroundColor: Colors.black54,),
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
            Padding(
              padding:  EdgeInsets.all(smallSpacing * 0.7),
              child: Text('Para finalizar el proceso selecciona la forma de pago a utilizar y llena los datos.', 
              style: TextStyle(fontSize: letterSize * 0.016), 
              textAlign: TextAlign.justify,),
            ),
            Text('Targetas', style: TextStyle(
             fontSize: letterSize * 0.016,
             fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,),
            Padding(
              padding: EdgeInsets.all(smallSpacing * 0.7),
              child: Row(
                children: [
                  SizedBox(width: broadSpacing * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: broadSpacing * 18,
                        child: Text('Paga con targetas de Debito/Credito ATC', 
                        textAlign: TextAlign.justify,
                         style: TextStyle(
                          color: Colors.black54, 
                          fontSize: letterSize * 0.015),
                        )                                         
                      ),
                    ],
                  ),
                  SizedBox(width: broadSpacing * 5),
                  SizedBox(
                    width: broadSpacing * 13,
                    child:  Text('Paga con targeta del BCP',
                     textAlign: TextAlign.start,
                     style: TextStyle(
                      color: Colors.black54,
                      fontSize: letterSize * 0.015
                      )
                    )
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: broadSpacing * 6),
                GestureDetector(
                  onTap: (){
                    if(_formKey.currentState?.validate()?? false){
                      Navigator.push(
                        context, MaterialPageRoute
                        (builder:(context)=> PagoVisaScreen(
                        ))
                      );
                    }
                  },                
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                       borderRadius: const BorderRadius.all(Radius.circular(10)
                      )
                    ),
                    child: Image.asset(
                      AssetImageApp.getvisa, 
                      width:imgSize * 0.4, 
                      height: image * 0.12
                    )
                  ),
                ),
                SizedBox(width: broadSpacing * 12),
                GestureDetector(
                  onTap: (){
                    if(_formKey.currentState?.validate()?? false){
                      Navigator.push(
                        context, MaterialPageRoute
                        (builder:(context)=> PagoBcpScreen(
                        ))
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), 
                      borderRadius: const  BorderRadius.all(Radius.circular(10)
                      )
                    ),
                    child: Image.asset(
                      AssetImageApp.getbcp, 
                      width:imgSize * 0.4, 
                      height: image * 0.12
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: smallSpacing),
            Text('Billeteras móviles', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: letterSize * 0.015
              ),
            ),
            SizedBox(height: smallSpacing * 0.01),
            Text('Paga con la billetera móvil Tigo Money',
              style: TextStyle(
                color: Colors.black54, 
                fontSize: letterSize * 0.015
              ),
            ),
            SizedBox(height: smallSpacing * 0.2),
            GestureDetector(
              onTap: (){
                if(_formKey.currentState?.validate()?? false){
                  Navigator.push(
                    context, MaterialPageRoute
                    (builder:(context)=> PagoTigoMoneyScreen())
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), 
                  borderRadius: const  BorderRadius.all(Radius.circular(10))
                ),
                child: Image.asset(
                  AssetImageApp.gettigoMoney,
                   width:imgSize * 0.5, 
                   height: image * 0.11
                )
              ),
            ),
            SizedBox(height: smallSpacing ),
            Text('Débito bancario', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: letterSize * 0.015
              ),
            ),
            SizedBox(height: smallSpacing * 0.01),
            Text('Paga con codigo QR del BCP',
             style: TextStyle(
              color: Colors.black54, 
              fontSize: letterSize * 0.015
              ),
            ), 
            SizedBox(height: smallSpacing *0.02),
            GestureDetector(
              onTap: (){
                if(_formKey.currentState?.validate()?? false){
                  Navigator.push(
                    context, MaterialPageRoute
                    (builder:(context)=> PagoQrScreen())
                  );
                }
              },
              child: Image.asset(AssetImageApp.getqr,
               width:imgSize * 0.6,
                height: image * 0.18
              ),
            )
          ],
        ),
      ),),
    );
  }
}
