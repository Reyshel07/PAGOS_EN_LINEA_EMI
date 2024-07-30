import 'package:cloud_firestore/cloud_firestore.dart';

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
  
  Future<void> incrementNumCity(context) async{   
    //final buscarCity = Provider.of<BucarEstudianteProvider>(context);
    try {
      DocumentReference counterRef = _firebaseFirestore.collection('counters').doc('1xaTUTgT5rS9d23yWjTC');

        await _firebaseFirestore.runTransaction((transaction)async{
          DocumentSnapshot counterGet = await transaction.get(counterRef);
          //String cityCount = buscarCity.unidadAcademica;
          int countInt = 0;
          int countLP = 0;
          int countSC = 0;
          int countC = 0;
          countInt = counterGet.get('count');
          countLP = counterGet.get('countLP');
          countSC = counterGet.get('countSC');
          countC = counterGet.get('countCo');
          //print(countLP);
          //print(countC);
          //print(countSC);      
          int nuevoCount = countInt+1;
          int nuevoCountLP = countLP+1;
          int nuevoCountSC = countSC + 1;
          int nuevoCountC = countC + 1;
          transaction.set(counterRef, {'count':nuevoCount});
          transaction.set(counterRef, {'countLp': nuevoCountLP});
          transaction.set(counterRef, {'countSc':nuevoCountSC});
          transaction.set(counterRef, {'countCo':nuevoCountC});

        }
      );
    } catch (e) {
      
    }
  }

  Future<int> obtenerGetNumCityLP() async{
    try {      
      DocumentReference counterRef = _firebaseFirestore.collection('counters').doc('1xaTUTgT5rS9d23yWjTC');
      int countLP = 0;
      await _firebaseFirestore.runTransaction((transaction)async{
        DocumentSnapshot counterGet = await transaction.get(counterRef);        
          countLP = counterGet.get('count');
        }
      );
      return countLP;
    } catch (e) {
    return 0;
    }
  }
  
}
