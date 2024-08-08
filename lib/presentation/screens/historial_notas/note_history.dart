import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pagos_en_linea_emi/config/theme/extension_theme.dart';
import 'package:pagos_en_linea_emi/utils/asset_image_app.dart';

class NoteHistoryScreen extends StatelessWidget {
  static const name ='NoteHistoryScreen';
  static const paht ='/NoteHistoryScreen';
  const NoteHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    //final double smallSpacing = screenSize.height * 0.02;
    final double broadSpacing = screenSize.width * 0.02;
    final double letterSize = screenSize.height ;
    final double imgSize = screenSize.width * 0.4;

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
      body: Stack(
         children: [
          Padding(padding: EdgeInsets.all(topPadding * 0.1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: broadSpacing * 25,
                    child: Text(
                      'HISTORIAL DE NOTAS EMI',
                      style: TextStyle(fontSize: letterSize * 0.030, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Image.asset(AssetImageApp.getLogo, width: imgSize * 0.5),
                ],
              ),           
            ],
          ),)
        ],
      ),
    );
  }
}