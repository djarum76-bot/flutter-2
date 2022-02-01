import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAlamatController extends GetxController {
  late TextEditingController provinsi;
  late TextEditingController kabkot;
  late TextEditingController kec;
  late TextEditingController detail;
  late TextEditingController kodepos;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Stream<DocumentSnapshot<Object?>> streamAlamat(String docID){
    DocumentReference address = firestore.collection('address').doc(docID);

    return address.snapshots();
  }

  void editAlamat(String docID, String provinsi, String kab_kot, String kec, String kodepos, String detail)async{
    DocumentReference address = firestore.collection('address').doc(docID);

    try{

      await address.update({
        "provinsi" : provinsi,
        "kab_kot": kab_kot,
        "kec": kec,
        "kodepos": kodepos,
        "detail": detail,
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil meng update alamat",
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
