import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID',decimalDigits: 0);
  final total = 0.obs;

  final alamat = "".obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final authC = Get.find<AuthController>();

  Stream<QuerySnapshot<Object?>> streamCart(){
    CollectionReference carts = firestore.collection('carts');

    return carts.where('uid_pembeli', isEqualTo: '${authC.box.read('uid')}').where('status', isEqualTo: 'Belum Bayar').where('tahap', isEqualTo: 2).orderBy('created_at').snapshots();
  }
}
