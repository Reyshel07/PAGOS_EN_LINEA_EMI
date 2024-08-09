import 'package:pagos_en_linea_emi/models/buscador_api.dart';
import 'package:flutter/material.dart';

class DetallesPago extends StatelessWidget {
  const DetallesPago({
    super.key,
    required this.topPadding,
    required this.screenSize,
    required this.smallSpacing,
    required this.letterSize,
    required this.broadSpacing,
    required this.totalMonto,
    required this.selectedItems,
    required this.totalDescuento,
    required this.monto,
  });

  final double topPadding;
  final Size screenSize;
  final double smallSpacing;
  final double letterSize;
  final double broadSpacing;
  final double totalMonto;
  final List<Item> selectedItems;
  final double totalDescuento;
  final double monto;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding * 0.02),
      child: Container(
        width: screenSize.width * 0.95,
        height: screenSize.height * 0.6,
        decoration:   BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: smallSpacing *0.5,vertical: smallSpacing * 0.6),
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
                    SizedBox(width: screenSize.width * 0.02),                     
                    Column(
                      children: [
                        SizedBox(height: screenSize.height * 0.01, width: screenSize.height * 0.01,),
                        CircleAvatar(
                         maxRadius: screenSize.height * 0.012, 
                         minRadius: screenSize.height * 0.012, 
                         backgroundColor: Colors.black54,
                         child: Text('1', style: TextStyle(fontSize: letterSize * 0.01),)
                        ),
                      ],
                    ),
                    SizedBox(width: screenSize.height * 0.005,),
                    Text('Detalles de tu pago', 
                    style: TextStyle(fontSize: letterSize * 0.015,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: smallSpacing ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MONTO A PAGAR',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 12, 68, 114), 
                        fontSize: letterSize * 0.015,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(width: broadSpacing),
                    Text('$monto', 
                      style: TextStyle(
                        fontSize: letterSize * 0.025, 
                        fontWeight: FontWeight.bold, 
                      )
                    ),
                  ],
                )
              ],
            ),
            SizedBox( height: smallSpacing * 1),
            Column(                                 
              children: [
                SizedBox(                                      
                  width: screenSize.width * 0.85,                                      
                  child: Row(                                       
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Concepto', 
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      SizedBox(
                        width: screenSize.width * 0.20,
                      ),
                       Text('Descuento(BS)',
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      SizedBox(
                        width: screenSize.width *0.04,
                      ),
                      Text('Total(BS)',
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold,
                        )
                      ),                                         
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: screenSize.width *0.85,
              child: const Divider()
            ),
            SizedBox(height: smallSpacing * 0.01),
            Column(  
              mainAxisSize: MainAxisSize.max,                               
              children: [
                SizedBox(
                  height: smallSpacing * 6.2,
                  width: screenSize.width *0.85,
                  child: ListView.builder(
                    padding:  EdgeInsets.symmetric( vertical: screenSize.width * 0.005),
                    itemCount: selectedItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = selectedItems[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenSize.width * 0.55,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenSize.width * 0.4,
                                  child: Text("- ${item.item}", 
                                    style:  TextStyle(
                                      fontSize: letterSize * 0.015,
                                    ),

                                  )
                                ),
                                Text("- ${item.descuento}", style:  TextStyle(fontSize: letterSize * 0.015),),
                              ],
                            ),
                          ),
                          
                          SizedBox(
                            width: screenSize.width *0.05,
                          ),
                          Text("-${item.montototal}", style: TextStyle(fontSize: letterSize * 0.015),),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: smallSpacing *0.01),
            SizedBox(
              width: screenSize.width *0.85,
              child: const Divider(),
            ),
            SizedBox(height: smallSpacing,),
            SizedBox(
              width: screenSize.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Cantidad:',
                    style: TextStyle( 
                      fontSize: letterSize * 0.015,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ), 
                  Text(
                    '${ selectedItems.length}',
                    style: TextStyle(
                      fontSize: letterSize * 0.015,                      
                    )
                  ),                                
                ],
              ),
            ),
            SizedBox(height: smallSpacing),
            SizedBox(
            width: screenSize.width *0.85,
            child: const Divider()
            ),
            SizedBox(height: smallSpacing * 0.5),
            SizedBox(
              width: screenSize.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Sub Total (Bs):',
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      Text('Descuento(Bs):',
                        style: TextStyle(
                          fontSize: letterSize * 0.015,
                          fontWeight: FontWeight.bold, 
                        )
                      ),
                      Text('MONTO TOTAL (Bs):',
                        style: TextStyle(
                          fontSize: letterSize *0.015,
                          fontWeight: FontWeight.bold, 
                          color: const Color.fromARGB(255, 12, 68, 114)
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenSize.width * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('$totalMonto',
                          style: TextStyle(
                            fontSize: letterSize *0.015,
                          )
                        ),
                        Text('$totalDescuento', 
                          style: TextStyle(
                            fontSize: letterSize * 0.015, 
                          )
                        ),
                        Text('$monto', 
                          style: TextStyle(
                            fontSize: letterSize * 0.015,
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: smallSpacing * 2),                      
            SizedBox(
              width: screenSize.width * 0.85,
              child: Text('Pago seguro', 
                style: TextStyle(
                  fontSize: letterSize *0.014, 
                  color: Colors.black54
                ),
              ),
            ), 
          ],                             
        ),
      ),
    );
  }
}