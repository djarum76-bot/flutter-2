import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilController extends GetxController {
  late TextEditingController username;
  final authC = Get.find<AuthController>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final imageFile = File("").obs;
  final ambil = false.obs;
  final ext = "".obs;

  final downloadURL = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
  }

  Future<DocumentSnapshot<Object?>> getDataUser()async{
    DocumentReference docRef = firestore.collection('users').doc(authC.box.read('uid'));

    return docRef.get();
  }

  void editUser(String username)async{
    DocumentReference users = firestore.collection('users').doc(authC.box.read('uid'));

    try{
      String dateNow = DateTime.now().toIso8601String();

      await FirebaseStorage.instance
          .ref('${dateNow}.${ext}')
          .putFile(imageFile.value);

      downloadURL.value = await FirebaseStorage.instance.ref('${dateNow}.${ext}').getDownloadURL();

      await users.update({
        "username" : username,
        "profile": downloadURL.value
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil meng update data",
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
