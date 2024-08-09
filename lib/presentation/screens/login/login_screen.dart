import 'package:pagos_en_linea_emi/presentation/providers/auth_provider.dart';
import 'package:pagos_en_linea_emi/presentation/providers/buscar_estudiante_provider.dart';
import 'package:pagos_en_linea_emi/utils/asset_image_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController textEditingControllerUsername = TextEditingController();
TextEditingController textEditingControllerPassword = TextEditingController();

class LoginScreen extends StatelessWidget {
  static const name = 'LoginScreen';
  static const paht = '/LoginScreen';
  const LoginScreen({super.key});
  


  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<BuscarEstudianteProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double containerSize = screenSize.height * 0.3;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double imgSize = screenSize.width * 0.4;

      return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -containerSize / 2,
              left: -containerSize / 2,
              child: Transform.rotate(
                angle: -90 / -115,
                child: Container(
                  height: containerSize,
                  width: containerSize,
                  color: const Color.fromARGB(255, 12, 68, 114),
                ),
              ),
            ),
            Positioned(
              bottom: -containerSize / 2,
              right: -containerSize / 2,
              child: Transform.rotate(
                angle: -90 / -115,
                child: Container(
                  height: containerSize,
                  width: containerSize,
                  color: const Color.fromARGB(255, 12, 68, 114),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: topPadding * 0.10),
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: topPadding,
                      ),
                      Image.asset(AssetImageApp.getLogo, width: imgSize * 1.3,),
                      SizedBox(
                        height: smallSpacing * 2,
                      ),
                      Text(
                        'Pagos en Linea EMI',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: letterSize * 0.04 ),
                      ),
                      Text(
                        'Paga tus cuentas',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: letterSize *0.020),
                      ),
                      SizedBox(
                        height: smallSpacing * 2,
                      ),
                      Text(
                        'Buscar por:',
                        style: TextStyle(color: Colors.black54, fontSize: letterSize *0.025,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: smallSpacing,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: letterSize * 0.020),
                        controller: textEditingControllerUsername,
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: (BorderRadius.circular(10)),                       
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Ci, Codigo',
                          hintStyle:  TextStyle(fontSize: letterSize * 0.020,
                           color: const Color.fromARGB(136, 102, 100, 100)),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin:  EdgeInsets.only(top: smallSpacing * 2),
                          width: screenSize.width * 0.4,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {                   
                              String username = textEditingControllerUsername.text;
                  
                              authProvider.login("sintesis", "sintesis22",context);
                  
                              Future.delayed(const Duration(seconds: 1),(){
                                loginProvider.searchIDUser(username, context);
                              });

                            },
                            
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const  Color.fromRGBO(255, 176, 5, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                
                              ),
                              
                            ),
                            child: Text(
                              'Buscar',
                              style: TextStyle(color: Colors.white, fontSize: letterSize * 0.028),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:smallSpacing * 1,
                      ),
                      Center(
                        child: Text(
                          '100% Transacciones seguras',
                          style:  TextStyle(fontSize: letterSize * 0.012),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}