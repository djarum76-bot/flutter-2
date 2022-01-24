import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameC = TextEditingController();
    priceC = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameC.dispose();
    priceC.dispose();
  }

  void addProduct(String name, String price)async{
    CollectionReference products = firestore.collection('products');

    try{
      String dateNow = DateTime.now().toIso8601String();
      await products.add({
        "name" : name,
        "price" : int.parse(price),
        "time": dateNow
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahkan data",
          textConfirm: "yeee",
          onConfirm: (){
            Get.back();
            Get.back();
          }
      );
    }catch(e){
      print(e);
    }
  }
}
