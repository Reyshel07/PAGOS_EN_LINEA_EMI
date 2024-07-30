import 'package:PAGOS_EN_LINIA_EMI/config/theme/extension_theme.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/Pago_provider.dart';
import 'package:PAGOS_EN_LINIA_EMI/utils/asset_image_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PagoVisaScreen extends StatefulWidget {
  final PagoService pagoService = PagoService();
  static const name = 'pago-visa';
  static const path = '/pago-visa';
  PagoVisaScreen({super.key});


  @override
  _PagoVisaScreen createState() => _PagoVisaScreen();
}

class _PagoVisaScreen extends State<PagoVisaScreen>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PagoService pagoService = PagoService();
  final TextEditingController ciController = TextEditingController();
  final TextEditingController razonSocialController = TextEditingController();
  String? selectNacionalidad;
  String? selectEstado;
   @override
  void dispose() {
    ciController.dispose();
    razonSocialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double broadSpacing = screenSize.width * 0.02;
    final double imgSize = screenSize.width * 0.5;
    final double image = screenSize.height * 0.5;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;

    final List<String> Nacionalidad = ['Bolivia'];
    final List<String> Estado = ['Beni','Chuquisaca','Cochabamba','La Paz','Oruro','Pando','Potosi','Santa Cruz','Tarija'];

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
        child: Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(topPadding * 0.05),
                child: Container(
                  width: screenSize.width * 0.95,
                  height: screenSize.height * 0.9,
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
                        padding: EdgeInsets.all(smallSpacing * 0.6),
                        child: Row(
                          children: [
                            Text(
                              'Targeta de débito y crédito', 
                              style: TextStyle(fontSize: letterSize * 0.015),
                            ),
                            Image.asset(
                              AssetImageApp.getvisa,
                              width: imgSize * 0.4,
                              height: image * 0.12,),                   
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(smallSpacing * 0.6),
                        child: Column(
                          children: [
                            Text(
                              'Nueva Targeta', 
                              textAlign: TextAlign.end, 
                              style: TextStyle(
                                fontSize: letterSize * 0.015, 
                                fontWeight: FontWeight.bold),
                              ),
                            SizedBox(height: smallSpacing * 1),
                            SizedBox(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.05,
                              child: TextFormField(  
                                style: TextStyle(fontSize: letterSize * 0.015),
                                cursorColor: Colors.black87,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Requerido*';
                                  }
                                  return null;
                                },                             
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Nro de targeta*',
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
                            SizedBox(height: smallSpacing * 0.5),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.4,
                                    height: screenSize.height * 0.05,
                                    child: TextFormField(  
                                      style: TextStyle(fontSize: letterSize * 0.015),
                                      cursorColor: Colors.black87,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Requerido*';
                                        }
                                        return null;
                                      },                             
                                      decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Expiracion*',
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
                                    width: screenSize.width * 0.4,
                                    height: screenSize.height * 0.05,
                                    child: TextFormField(
                                      style: TextStyle(fontSize: letterSize * 0.015), 
                                      cursorColor: Colors.black87,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Requerido*';
                                        }
                                        return null;
                                      },                             
                                      decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'CVV*',
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
                                ],
                              ),
                            ),
                            SizedBox(height: smallSpacing),
                            Text(
                              'Datos del propietario de la targeta',
                              style: TextStyle(
                                fontSize: letterSize * 0.015, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: smallSpacing,),
                            SizedBox(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.05,
                              child: TextFormField(  
                                style: TextStyle(fontSize: letterSize * 0.015),
                                cursorColor: Colors.black87,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Requerido*';
                                  }
                                  return null;
                                },                             
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Nombres*',
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
                            SizedBox(height: smallSpacing * 0.5,),
                            SizedBox(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.05,
                              child: TextFormField( 
                                 style: TextStyle(fontSize: letterSize * 0.015),
                                cursorColor: Colors.black87,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Requerido*';
                                  }
                                  return null;
                                },                             
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Apellidos*',
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
                            SizedBox(height: smallSpacing * 0.5,),
                            SizedBox(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.05,
                              child: TextFormField(  
                                style: TextStyle(fontSize: letterSize * 0.015),
                                cursorColor: Colors.black87,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Requerido*';
                                  }
                                  return null;
                                },                             
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Email*',
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
                            SizedBox(height: smallSpacing * 0.5,),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.41,
                                    height: screenSize.height * 0.05,
                                    child: TextFormField(  
                                      style: TextStyle(fontSize: letterSize * 0.015),
                                      cursorColor: Colors.black87,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Requerido*';
                                        }
                                        return null;
                                      },                             
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        hintText: 'Telefono*',
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
                                    width: screenSize.width * 0.46,
                                    height: screenSize.height * 0.05,
                                    child: TextFormField(
                                      style: TextStyle(fontSize: letterSize * 0.015),  
                                      cursorColor: Colors.black87,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'requerido*';
                                        }
                                        return null;
                                      },                             
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        hintText: 'Direccion*',
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
                                ],
                              ),
                            ),
                            SizedBox(height: smallSpacing * 0.5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: screenSize.height * 0.05,
                                  width: screenSize.width * 0.41,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black87),
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: DropdownButton<String>(
                                    padding: EdgeInsets.all(topPadding * 0.05),
                                    hint: Text(
                                      'Seleccione un Pais',
                                      style: TextStyle(
                                        fontSize: letterSize * 0.015
                                      )
                                    ),
                                    value: selectNacionalidad,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectNacionalidad = newValue;
                                      });
                                    },
                                    items: Nacionalidad.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(

                                        value: value,
                                        child: Text(value, style: TextStyle(fontSize: letterSize * 0.015),),
                                      );
                                    }).toList(),
                                    underline:const SizedBox(),
                                  ),
                                ),
                                Container(
                                  height: screenSize.height * 0.05,
                                  width: screenSize.width * 0.46,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black87),
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: DropdownButton<String>(
                                    padding: EdgeInsets.all(topPadding * 0.05),
                                    hint: Text(
                                      'Seleccione un Estado',
                                      style: TextStyle(
                                        fontSize: letterSize * 0.015
                                      ),),
                                    value: selectEstado,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectEstado = newValue;
                                      });
                                    },
                                    items: Estado.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, style: TextStyle(fontSize: letterSize * 0.015),),
                                      );
                                    }).toList(),
                                    underline: const SizedBox(),
                                  ),
                                )
                              ],
                            ),                         
                            SizedBox(height: smallSpacing * 0.5,),                           
                            ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState?.validate()?? false){    
                                  pagoService.enviarDatos(context);                                                                       
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                'Realizar Pago',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 12, 68, 114),
                                  fontSize: letterSize * 0.020,
                                  fontWeight: FontWeight.bold,
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),                                                  
                    ]
                  )
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}
    