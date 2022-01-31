import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:firecommerce/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
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

  void addCart(String namaProduk, int harga, String gambar, String uid, int stok)async{
    CollectionReference carts = firestore.collection('carts');

    try{
      String dateNow = DateTime.now().toIso8601String();

      await carts.add({
        "nama_produk" : namaProduk,
        "harga": harga,
        "jumlah": 1,
        "gambar": gambar,
        "status": "Belum Bayar",
        "uid_pembeli": authC.box.read('uid'),
        "created_at": dateNow,
        "tahap" : 1,
        "uid_produk" : uid
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahkan barang ke dalam cart",
          textConfirm: "okee",
          onConfirm: (){
            Get.back();
            Get.offNamed(Routes.CART);
          }
      );
    }catch(e){
      print(e);
    }
  }
}
