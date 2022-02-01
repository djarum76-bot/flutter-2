import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProdukSayaController extends GetxController {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID',decimalDigits: 0);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final authC = Get.find<AuthController>();

  Stream<QuerySnapshot<Object?>> streamProduct(){
    CollectionReference products = firestore.collection('products');

    return products.where('uid_penjual', isEqualTo: authC.box.read('uid')).orderBy('created_at').snapshots();
  }
}
