import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData()async{
    CollectionReference products = firestore.collection('products');

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData(){
    CollectionReference products = firestore.collection('products');

    // return products.where('price', isGreaterThanOrEqualTo: 33333333334).snapshots();
    return products.orderBy('time').snapshots();
  }

  void deleteProduct(String docID)async{
    DocumentReference docData = firestore.collection('products').doc(docID);

    await docData.delete();
  }
}
