import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrasiTokoController extends GetxController {
  late TextEditingController nama_toko;
  late TextEditingController alamat_toko;
  late TextEditingController no_hp;

  final loading = false.obs;

  final authC = Get.find<AuthController>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nama_toko = TextEditingController();
    alamat_toko = TextEditingController();
    no_hp = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nama_toko.dispose();
    alamat_toko.dispose();
    no_hp.dispose();
  }

  Future<DocumentSnapshot<Object?>> getDataUser()async{
    DocumentReference docRef = firestore.collection('users').doc(authC.box.read('uid'));

    return docRef.get();
  }

  void regisToko(String nama_toko, String alamat_toko, String no_hp)async{
    loading.value = true;

    DocumentReference users = firestore.collection('users').doc(authC.box.read('uid'));

    try{
      String noHP = "+62${no_hp}";

      await users.update({
        "role" : "penjual",
        "nama_toko" : nama_toko,
        "alamat_toko" : alamat_toko,
        "no_hp": noHP
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil registrasi toko, sekarang anda bisa menambahkan produk yang akan dijual",
          textConfirm: "OKE",
          onConfirm: (){
            loading.value = false;
            Get.back();
            Get.back();
          }
      );
    }catch(e){
      print(e);
    }
  }
}
