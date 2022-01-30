import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:firecommerce/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailController extends GetxController {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID',decimalDigits: 0);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final authC = Get.find<AuthController>();

  Stream<DocumentSnapshot<Object?>> getProduct(){
    DocumentReference product = firestore.collection('products').doc(Get.arguments);

    return product.snapshots();
  }
}
