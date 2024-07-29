import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/buscar_estudiante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class datosenvio extends StatefulWidget {

  datosenvio({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.topPadding,
    required this.screenSize,
    required this.smallSpacing,
    required this.broadSpacing,
    required this.letterSize,
    required this.valueCi,
    required this.valueRazonSocial,
    required this.valueCorreo,
    required BucarEstudianteProvider buscarEstudianteProvider,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final double topPadding;
  final Size screenSize;
  final double smallSpacing;
  final double broadSpacing;
  final double letterSize;
  final String valueCi;
  final String valueRazonSocial;
  final String valueCorreo;

  @override
  _datosenvio createState()=> _datosenvio(
    formKey: _formKey,
    topPadding: topPadding,
    screenSize: screenSize,
    smallSpacing: smallSpacing,
    broadSpacing: broadSpacing,
    letterSize: letterSize,
    valueCi: valueCi,
    valueRazonSocial: valueRazonSocial,
    valueCorreo: valueCorreo,
    buscarEstudianteProvider: BucarEstudianteProvider()
  );
}
class _datosenvio extends State<datosenvio>{
  
  _datosenvio({
    required GlobalKey<FormState> formKey,
    required this.topPadding,
    required this.screenSize,
    required this.smallSpacing,
    required this.broadSpacing,
    required this.letterSize,
    required this.valueCi,
    required this.valueRazonSocial,
    required this.valueCorreo,
    required BucarEstudianteProvider buscarEstudianteProvider,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final double topPadding;
  final Size screenSize;
  final double smallSpacing;
  final double broadSpacing;
  final double letterSize;
  final String valueCi;
  final String valueRazonSocial;
  final String valueCorreo;
  String? selectedOption;


  @override
  Widget build(BuildContext context) {
    final buscarEstudianteProvider =Provider.of<BucarEstudianteProvider>(context);
    final List<String> option = [
      'Céluda de Identidad',
      'CI Extranjero',
      'NIT',
      'Pasaporte',
      'Otros'
    ];
    return Form(
      key: _formKey,
      child: Container(
        child: Padding(padding: EdgeInsets.only(top: topPadding * 0.05),
        child: Container(
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.35,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: const  BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(smallSpacing * 0.7),
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
                          CircleAvatar(child: Text('2',style: TextStyle(fontSize: letterSize * 0.01),), 
                          maxRadius: screenSize.height * 0.012, 
                          minRadius: screenSize.height * 0.012, 
                          backgroundColor: Colors.black54,),
                        ],
                      ),
                      SizedBox(width: screenSize.height * 0.005),
                      Text('Dato para el envío del comprobante/factura', 
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: smallSpacing * 0.4),
              SizedBox(
                width: screenSize.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [                                       
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      width: screenSize.width * 0.48,
                      height: screenSize.height * 0.05,
                      child: DropdownButton<String>(  
                        padding: EdgeInsets.all(topPadding * 0.05),            
                        hint: Text(
                          'Tipo de documento*',
                          style: TextStyle(fontSize: letterSize * 0.018)),
                        value: selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOption = newValue!;
                          });
                        },
                        items: option.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(fontSize: letterSize * 0.015)),
                          );
                        }).toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.29,
                      height: screenSize.height * 0.05,
                      child:TextFormField(
                        style: TextStyle(fontSize: letterSize * 0.019), 
                        onChanged: (value) {                       
                          buscarEstudianteProvider.ciValue=value;
                        },
                        initialValue: buscarEstudianteProvider.ci,
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
                          hintText: 'Numero documento*',
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
                    )
                  ]
                ),
              ),
              SizedBox(height: smallSpacing * 1,),
              SizedBox(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.05,
                child: TextFormField(
                  style: TextStyle(fontSize: letterSize * 0.019),     
                  onChanged: (value){
                    value = valueCorreo;
                  },
                  initialValue: valueCorreo,                       
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
                      borderRadius: BorderRadius.circular(5)
                    ),
                    hintText: 'Correo Electronico*',
                    hintStyle: TextStyle(fontSize: letterSize * 0.015
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
              SizedBox(height: smallSpacing * 1),
              SizedBox(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.05,
                child: TextFormField( 
                  style: TextStyle(fontSize: letterSize * 0.019), 
                  onChanged: (value) {
                    buscarEstudianteProvider.razonsocialValue=value;
                  }, 
                  initialValue: buscarEstudianteProvider.ciNit,
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
                      borderRadius: BorderRadius.circular(5)
                    ),
                    
                    hintText: 'Razón social*',
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
        ),),
      ),
    );
  }
}