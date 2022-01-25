import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final imageFile = File("").obs;
  final ambil = false.obs;
  final ext = "".obs;

  final downloadURL = "".obs;

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
    ambil.value = false;
  }

  void addProduct(String name, String price)async{
    CollectionReference products = firestore.collection('products');

    try{
      String dateNow = DateTime.now().toIso8601String();

      await FirebaseStorage.instance
          .ref('${dateNow}.${ext}')
          .putFile(imageFile.value);

      downloadURL.value = await FirebaseStorage.instance.ref('${dateNow}.${ext}').getDownloadURL();

      await products.add({
        "name" : name,
        "price" : int.parse(price),
        "time": dateNow,
        "gambar": downloadURL.value
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

  ambilGambar()async{
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
    );

    if(image != null){
      ambil.value = true;
      imageFile.value = File(image.path);

      ext.value = image.name.split('.').last;
    }
  }
}
