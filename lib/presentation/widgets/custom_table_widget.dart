import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final String numeral;
  final String titleDetalle;
  final String contentDetalle;
  final String titleMonto;
  final String contentMonto;
  final String titlecodigo;
  final String contentcodigo;
  final List<Widget> children; 

  const CustomTable(
      {super.key,
      required this.numeral,
      required this.titleDetalle,
      required this.contentDetalle,
      required this.titleMonto,
      required this.contentMonto,
      required this.children,
      required this.titlecodigo,
      required this.contentcodigo
    });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    final double smallSpacing = screenSize.height * 0.02;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(topPadding *0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              numeral,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: letterSize * 0.018),
            ),
             Text(titleDetalle ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: letterSize * 0.018)),
            Row(
              children: [
                 SizedBox(
                  width: screenSize.width * 0.50,
                  child: Text(
                    contentDetalle, style: TextStyle(fontSize: letterSize * 0.018),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: screenSize.width * 0.25,
                  height: screenSize.height * 0.15,
                  child: Column(
                    children: children,
                  ),
                ),               
              ],
            ),
             Row(
              children: [
                Text(titleMonto, style:  TextStyle(fontWeight: FontWeight.bold, fontSize: letterSize * 0.018)),
                SizedBox(width: smallSpacing * 0.7),
                Text(contentMonto,  style:  TextStyle(fontWeight: FontWeight.w400, fontSize: letterSize * 0.018)),                
              ],
            ),
            
            Row(
              children: [
                Text(titlecodigo, style:  TextStyle(fontWeight: FontWeight.bold, fontSize: letterSize * 0.018)),
                SizedBox(width: smallSpacing * 0.5),
                Text(contentcodigo, style:  TextStyle(fontWeight: FontWeight.w400, fontSize: letterSize * 0.018),)
              ],
            )
          ],
        ),
      ),
    );
  }
}