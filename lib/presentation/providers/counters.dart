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
         print(nuevoCount);
      });
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

      });
      return countInt;
    } catch (e) {
    return 0;
    }
    
  }
  
}