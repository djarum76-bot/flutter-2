import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class PilihAlamatController extends GetxController {
  var alamat = "".obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final authC = Get.find<AuthController>();

  Stream<QuerySnapshot<Object?>> streamAlamat(){
    CollectionReference address = firestore.collection('address');

    return address.where('uid', isEqualTo: '${authC.box.read('uid')}').orderBy('created_at').snapshots();
  }

  hapus(String docID)async{
    DocumentReference address = firestore.collection('address').doc(docID);
    await address.delete();
  }
}
