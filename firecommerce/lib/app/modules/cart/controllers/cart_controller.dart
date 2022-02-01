import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartController extends GetxController {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID',decimalDigits: 0);
  final total = 0.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final authC = Get.find<AuthController>();

  Stream<QuerySnapshot<Object?>> streamCart(){
    CollectionReference carts = firestore.collection('carts');

    return carts.where('uid_pembeli', isEqualTo: '${authC.box.read('uid')}').where('status', isEqualTo: 'Belum Bayar').where('tahap', isEqualTo: 1).orderBy('created_at').snapshots();
  }

  hapus(String docID)async{
    DocumentReference productCart = firestore.collection('carts').doc(docID);
    total.value = 0;
    await productCart.delete();
  }

  kurang(String docID, int jumlah, int harga)async{
    DocumentReference productCart = firestore.collection('carts').doc(docID);

    if(jumlah < 2){

    }else{
      total.value = 0;
      await productCart.update({
        "jumlah" : jumlah - 1
      });
    }
  }

  tambah(String docID, int jumlah, int harga)async{
    DocumentReference productCart = firestore.collection('carts').doc(docID);
    total.value = 0;

    await productCart.update({
      "jumlah" : jumlah + 1
    });
  }

  beli(String docID)async{
    DocumentReference productCart = firestore.collection('carts').doc(docID);

    await productCart.update({
      "tahap" : 2
    });
  }
}
