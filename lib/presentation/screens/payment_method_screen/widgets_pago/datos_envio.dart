import 'package:pagos_en_linea_emi/presentation/providers/buscar_estudiante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatosEnvio extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final double topPadding;
  final Size screenSize;
  final double smallSpacing;
  final double broadSpacing;
  final double letterSize;
  final String valueCi;
  final String valueRazonSocial;
  final String valueCorreo;

  const DatosEnvio({
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
  }) : _formKey = formKey;

  @override
  State<DatosEnvio> createState() => _DatosEnvioState();
}

class _DatosEnvioState extends State<DatosEnvio> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final buscarEstudianteProvider =Provider.of<BuscarEstudianteProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final List<String> option = [
      'Céluda de Identidad',
      'CI Extranjero',
      'NIT',
      'Pasaporte',
      'Otros'
    ];   
    return Form(
      key: widget._formKey,
      child: Padding(padding: EdgeInsets.only(top: widget.topPadding * 0.05),
      child: Container(
        width: widget.screenSize.width * 0.95,
        height: widget.screenSize.height * 0.35,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const  BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: smallSpacing *0.5,vertical: smallSpacing * 0.6),
              child: Container(
                height: widget.screenSize.height * 0.05,
                width: widget.screenSize.width * 3,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                   color: Colors.black12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[   
                    SizedBox(width: widget.broadSpacing),                     
                    Column(
                      children: [
                        SizedBox(height: widget.screenSize.height * 0.01, width: widget.screenSize.width * 0.01),
                        CircleAvatar(
                          maxRadius: widget.screenSize.height * 0.012, 
                          minRadius: widget.screenSize.height * 0.012, 
                          backgroundColor: Colors.black54,
                          child: Text('2',style: TextStyle(fontSize: widget.letterSize * 0.01),)
                        ),
                      ],
                    ),
                    SizedBox(width: widget.screenSize.height * 0.005),
                    Text('Dato para el envío del comprobante/factura', 
                      style: TextStyle(
                        fontSize: widget.letterSize * 0.015,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: widget.smallSpacing * 0.4),
            SizedBox(
              width: widget.screenSize.width * 0.86,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [                                       
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    width: widget.screenSize.width * 0.50,
                    height: widget.screenSize.height * 0.05,
                    child: DropdownButton<String>(  
                      padding: EdgeInsets.all(widget.topPadding * 0.05),            
                      hint: Text(
                        'Tipo de documento*',
                        style: TextStyle(fontSize: widget.letterSize * 0.018)),
                      value: selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption = newValue!;
                        });
                      },
                      items: option.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: widget.letterSize * 0.015)),
                        );
                      }).toList(),
                      underline: const SizedBox(),
                    ),
                  ),
                  SizedBox(
                    width: widget.screenSize.width * 0.29,
                    height: widget.screenSize.height * 0.05,
                    child:TextFormField(
                      style: TextStyle(fontSize: widget.letterSize * 0.019), 
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
                          fontSize: widget.letterSize * 0.015,
                        ),
                        errorStyle: TextStyle(
                          fontSize: widget.letterSize * 0.015, 
                          color: Colors.red.shade800, 
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.red.shade800, 
                            width: widget.screenSize.width * 0.005,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.red.shade800, 
                            width: widget.screenSize.width * 0.005, 
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12.0),
                      ),
                    ),
                  )
                ]
              ),
            ),
            SizedBox(height: widget.smallSpacing * 1,),
            SizedBox(
              width: widget.screenSize.width * 0.86,
              height: widget.screenSize.height * 0.05,
              child: TextFormField(
                style: TextStyle(fontSize: widget.letterSize * 0.019),     
                onChanged: (value){
                  value = widget.valueCorreo;
                },
                initialValue: widget.valueCorreo,                       
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
                  hintStyle: TextStyle(fontSize: widget.letterSize * 0.015
                  ),
                  errorStyle: TextStyle(
                    fontSize: widget.letterSize * 0.015, 
                    color: Colors.red.shade800, 
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.red.shade800, 
                      width: widget.screenSize.width * 0.005,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.red.shade800, 
                      width: widget.screenSize.width * 0.005, 
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12.0),
                ),
              ),
            ),
            SizedBox(height: widget.smallSpacing * 1),
            SizedBox(
              width: widget.screenSize.width * 0.86,
              height: widget.screenSize.height * 0.05,
              child: TextFormField( 
                style: TextStyle(fontSize: widget.letterSize * 0.019), 
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
                  fontSize: widget.letterSize * 0.015,                   
                  ),
                  errorStyle: TextStyle(
                    fontSize: widget.letterSize * 0.015, 
                    color: Colors.red.shade800, 
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.red.shade800, 
                      width: widget.screenSize.width * 0.005,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.red.shade800, 
                      width: widget.screenSize.width * 0.005, 
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12.0),
                ),
              ),
            ), 
          ],
        ),
      ),),
    );
  }
}