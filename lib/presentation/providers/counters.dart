import 'package:PAGOS_EN_LINIA_EMI/presentation/providers/buscar_estudiante_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountersServices {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> incrementCounter() async{   
    try {
      DocumentReference counterRef = _firebaseFirestore.collection('counters').doc('1xaTUTgT5rS9d23yWjTC');

        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          int countInt = 0;
          countInt = counterGet.get('count');
          
          int nuevoCount = countInt+1;
          transaction.set(counterRef, {'count':nuevoCount});
        }
      );
    } catch (e) {
      
    }
  }

  Future<int> obtenerGet() async{
      try {       
        DocumentReference counterRef = _firebaseFirestore.collection('counters').doc('1xaTUTgT5rS9d23yWjTC');
        int countInt = 0;
        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          
          countInt = counterGet.get('count');

          }
        );
        return countInt;
      } catch (e) {
      return 0;
      }
      
    }

  Future<void> incremenNumCity (BuildContext context)async{    
    final buscarcity = Provider.of<BucarEstudianteProvider>(context, listen: false);
    final city = buscarcity.unidadAcademica;
    String? La_Paz;
    String? Cochabamba;
    String? Riberalta;
    String? Tropico;

    Future<void> increNumTro(BuildContext context) async{   
      try {
        DocumentReference counterRef = _firebaseFirestore.collection('counters').doc('1xaTUTgT5rS9d23yWjTC');

          await _firebaseFirestore.runTransaction((transaction)async{
            DocumentSnapshot counterGet = await transaction.get(counterRef);
            int countInt = 0;
            countInt = counterGet.get('count');
            
            int nuevoCount = countInt+1;
            transaction.set(counterRef, {'count':nuevoCount});
            print(nuevoCount);
          }
        );
      } catch (e) {
        
      }
    }

    Future<void> increNumCocha() async{   
      try {
        DocumentReference counterRef = _firebaseFirestore.collection('countersCo').doc('q9m4ud7MwXWN3FgyDdBE');

          await _firebaseFirestore.runTransaction((transaction)async{
            DocumentSnapshot counterGet = await transaction.get(counterRef);
            int countIntCo = 0;
            countIntCo = counterGet.get('countCo');
            
            int nuevoCount = countIntCo+1;
            transaction.set(counterRef, {'countCo':nuevoCount});
            print(nuevoCount);
          }
        );
      } catch (e) {
        
      }
    }

    Future<void> increNumScruz() async{   
      try {
        DocumentReference counterRef = _firebaseFirestore.collection('countersSc').doc('lATSGKaDoaKqDAj3plg4');

          await _firebaseFirestore.runTransaction((transaction)async{
            DocumentSnapshot counterGet = await transaction.get(counterRef);
            int countIntSc = 0;
            countIntSc = counterGet.get('countSc');
            
            int nuevoCount = countIntSc+1;
            transaction.set(counterRef, {'countSc':nuevoCount});
            print(nuevoCount);
          }
        );
      } catch (e) {
        
      }
    }

    Future<void> increNumLp() async{   
      try {
        DocumentReference counterRef = _firebaseFirestore.collection('countersLp').doc('QHmnfy4Ao4zzQJrgo8Kq');

          await _firebaseFirestore.runTransaction((transaction)async{
            DocumentSnapshot counterGet = await transaction.get(counterRef);
            int countIntSc = 0;
            countIntSc = counterGet.get('countLp');
            
            int nuevoCount = countIntSc+1;
            transaction.set(counterRef, {'countLp':nuevoCount});
            print(nuevoCount);
          }
        );
      } catch (e) {
        
      }
    }

    Future<void> increNumRi() async{   
      try {
        DocumentReference counterRef = _firebaseFirestore.collection('countersRi').doc('r9eeTOO327BF6UKd4lh8');

          await _firebaseFirestore.runTransaction((transaction)async{
            DocumentSnapshot counterGet = await transaction.get(counterRef);
            int countIntSc = 0;
            countIntSc = counterGet.get('countRi');
            
            int nuevoCount = countIntSc+1;
            transaction.set(counterRef, {'countRi':nuevoCount});
            print(nuevoCount);
          }
        );
      } catch (e) {
        
      }
    }
  
    if (city == Cochabamba) {
      increNumCocha();
    }else if(city == Riberalta){
      increNumRi();
    }else if(city == Tropico){
      increNumTro(context);
    }else if(city == La_Paz){
      increNumLp();
    }else{
      increNumScruz();
    }
    print( incremenNumCity(context));
  
  }

  Future <void> enviarNum (context)async{
    final buscarcity = Provider.of<BucarEstudianteProvider>(context);
    final city = buscarcity.unidadAcademica;
    String? La_Paz;
    String? Cochabamba;
    String? Riberalta;
    String? Tropico;

    Future<int> obtenerGet() async{
      try {
        
        DocumentReference counterRef = _firebaseFirestore.collection('counters').doc('1xaTUTgT5rS9d23yWjTC');
        int countInt = 0;
        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          
          countInt = counterGet.get('count');

          }
        );
        return countInt;
      } catch (e) {
      return 0;
      }
      
    }
    
    Future<int> obtenerGetCocha() async{
      try {
        
        DocumentReference counterRef = _firebaseFirestore.collection('countersCo').doc('q9m4ud7MwXWN3FgyDdBE');
        int countIntCo = 0;
        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          
          countIntCo = counterGet.get('countCo');

          }
        );
        return countIntCo;
      } catch (e) {
      return 0;
      }


      
    }

    Future<int> obtenerGetScruz() async{
      try {
        
        DocumentReference counterRef = _firebaseFirestore.collection('countersSc').doc('lATSGKaDoaKqDAj3plg4');
        int countIntSc = 0;
        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          
          countIntSc = counterGet.get('countSc');

          }
        );
        return countIntSc;
      } catch (e) {
      return 0;
      }

    }

    Future<int> obtenerGetLp() async{
      try {
        
        DocumentReference counterRef = _firebaseFirestore.collection('countersLp').doc('QHmnfy4Ao4zzQJrgo8Kq');
        int countIntLp = 0;
        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          
          countIntLp = counterGet.get('countLp');

          }
        );
        return countIntLp;
      } catch (e) {
      return 0;
      }

    }

    Future<int> obtenerGetRi() async{
      try {
        
        DocumentReference counterRef = _firebaseFirestore.collection('countersRi').doc('r9eeTOO327BF6UKd4lh8');
        int countIntLp = 0;
        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          
          countIntLp = counterGet.get('countRi');

          }
        );
        return countIntLp;
      } catch (e) {
      return 0;
      }

    }
  
    if (city == Cochabamba) {
      obtenerGetCocha();
    }else if (city == Riberalta){
      obtenerGetRi();
    }else if(city == Tropico ){
      obtenerGet();
    }else if(city == La_Paz){
      obtenerGetLp();
    }else{
      obtenerGetScruz();
    }
  }

}
  
