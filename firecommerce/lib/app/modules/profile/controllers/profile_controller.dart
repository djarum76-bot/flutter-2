import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final authC = Get.find<AuthController>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getDataUser()async{
    CollectionReference user = firestore.collection('users');

    return user.where('uid', isEqualTo: authC.box.read('uid')).get();
  }

  Stream<QuerySnapshot<Object?>> streamDataUser(){
    CollectionReference user = firestore.collection('users');

    return user.where('uid', isEqualTo: authC.box.read('uid')).snapshots();
  }
}
