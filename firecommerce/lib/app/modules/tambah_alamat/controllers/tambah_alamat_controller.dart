import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahAlamatController extends GetxController {
  late TextEditingController provinsi;
  late TextEditingController kabkot;
  late TextEditingController kec;
  late TextEditingController detail;
  late TextEditingController kodepos;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final authC = Get.find<AuthController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provinsi = TextEditingController();
    kabkot = TextEditingController();
    kec = TextEditingController();
    detail = TextEditingController();
    kodepos = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provinsi.dispose();
    kabkot.dispose();
    kec.dispose();
    detail.dispose();
    kodepos.dispose();
  }

  void addAlamat(String provinsi, String kab_kot, String kec, String kodepos, String detail)async{
    CollectionReference address = firestore.collection('address');

    try{
      String dateNow = DateTime.now().toIso8601String();

      await address.add({
        "provinsi" : provinsi,
        "kab_kot": kab_kot,
        "kec": kec,
        "kodepos": kodepos,
        "detail": detail,
        "uid": authC.box.read('uid'),
        "created_at": dateNow,
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahkan alamat",
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
