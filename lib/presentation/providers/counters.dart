import 'package:cloud_firestore/cloud_firestore.dart';


class CountersServices {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> increNumTro() async{   
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

  Future<int> obtenerGetTro() async{
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
}
  
