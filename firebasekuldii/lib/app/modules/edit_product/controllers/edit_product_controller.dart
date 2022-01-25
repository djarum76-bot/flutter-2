import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  late Rx<File> imageFile;

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

  Future<DocumentSnapshot<Object?>> getData(String docID)async{
    DocumentReference docRef = firestore.collection('products').doc(docID);

    return docRef.get();
  }

  void editProduct(String name, String price, String docID)async{
    DocumentReference docData = firestore.collection('products').doc(docID);

    try{
      await docData.update({
        "name":name,
        "price":int.parse(price)
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
