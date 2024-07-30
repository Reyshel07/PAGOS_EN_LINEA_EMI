import 'package:PAGOS_EN_LINIA_EMI/config/theme/extension_theme.dart';
import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/Pago_provider.dart';
import 'package:PAGOS_EN_LINIA_EMI/utils/asset_image_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PagoBcpScreen extends StatefulWidget {
  final PagoService pagoService = PagoService();
  static const name = 'pago-bcp';
  static const path = '/pago-bcp';

  @override
  _PagoBcpScreenState createState() => _PagoBcpScreenState();
}

class _PagoBcpScreenState extends State<PagoBcpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PagoService pagoService = PagoService();
  String? selectedCardType;
  String? selectedIdType;



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double smallSpacing = screenSize.height * 0.02;
    final double broadSpacing = screenSize.width * 0.02;
    final double imgSize = screenSize.width * 0.5;
    final double image = screenSize.height * 0.5;
    final double letterSize = screenSize.height;

    final List<String> cardTypes = ['Tarjeta de Débito', 'Tarjeta de Crédito'];
    final List<String> idTypes = ['La Paz', 'Santa Cruz', 'Cochabamba', 'Tarija', 'Oruro', 'Chuquisaca', 'Pando', 'Potosí', 'Beni'];

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
                  height: screenSize.height * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                            color: Colors.black12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: broadSpacing),
                              Column(
                                children: [
                                  SizedBox(
                                    height: screenSize.height * 0.01,
                                    width: screenSize.width * 0.01,
                                  ),
                                  CircleAvatar(
                                    child: Text('3', style: TextStyle(fontSize: letterSize * 0.01),),
                                    maxRadius: screenSize.height * 0.012,
                                    minRadius: screenSize.height * 0.012,
                                    backgroundColor: Colors.black54,
                                  ),
                                ],
                              ),
                              SizedBox(width: screenSize.height * 0.005),
                              Text(
                                'Seleccione tu forma de pago',
                                style: TextStyle(
                                  fontSize: letterSize * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                  'Tarjeta BCP',
                                  style: TextStyle(
                                    fontSize: letterSize * 0.015,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset(
                                  AssetImageApp.getbcp,
                                  width: imgSize * 0.4,
                                  height: image * 0.12,
                                ),
                              ],
                            ),
                            SizedBox(height: smallSpacing * 0.05),
                            Text(
                              'Ingresa los datos de tu tarjeta',
                              style: TextStyle(
                                fontSize: letterSize * 0.015,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: smallSpacing * 1),
                            Container(
                              height: screenSize.height * 0.05,
                              width: screenSize.width * 0.55,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: DropdownButton<String>(
                                padding: EdgeInsets.all(topPadding * 0.05),
                                hint: Text(
                                  'Seleccione el tipo de tarjeta', 
                                  style: TextStyle(
                                    fontSize: letterSize * 0.015
                                  ),
                                ),
                                value: selectedCardType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCardType = newValue;
                                  });
                                },
                                items: cardTypes.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: TextStyle(fontSize: letterSize * 0.015),),
                                  );
                                }).toList(),
                                underline: const SizedBox(),
                              ),
                            ),
                            SizedBox(height: smallSpacing * 0.2),
                            SizedBox(
                              width: screenSize.width * 0.3,
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
                                  hintText: 'Expiración*',
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
                            SizedBox(height: smallSpacing),
                            Text(
                              'Ingresa tu célula de identidad',
                              style: TextStyle(
                                fontSize: letterSize * 0.015,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: smallSpacing),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 12, 68, 114),
                              ),
                              width: screenSize.width * 0.8,
                              child: Padding(
                                padding: EdgeInsets.all(topPadding * 0.08),
                                child: Text(
                                  'El campo complemento no es obligatorio, solo debe llenarlo en caso su célula de identidad tenga terminación alfanumérica (CI duplicado, entre otros)',
                                  style: TextStyle(
                                    fontSize: letterSize * 0.017,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(height: smallSpacing),
                            SizedBox(
                              width: screenSize.width * 0.8,
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
                            SizedBox(height: smallSpacing),
                            SizedBox(
                              width: screenSize.width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.3,
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
                                  hintText: 'Complemento*',
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
                                  Container(
                                    height: screenSize.height * 0.05,
                                    width: screenSize.width * 0.34,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: DropdownButton<String>(
                                      padding: EdgeInsets.all(topPadding * 0.05),
                                      hint: Text(
                                        'Extensión*',
                                        style: TextStyle(fontSize: letterSize * 0.015),),
                                      value: selectedIdType,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedIdType = newValue;
                                        });
                                      },
                                      items: idTypes.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value, style: TextStyle(fontSize: letterSize * 0.015),),
                                        );
                                      }).toList(),
                                      underline: const SizedBox(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: smallSpacing),
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}