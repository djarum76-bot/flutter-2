import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahProdukController extends GetxController {
  late TextEditingController nama_produk;
  late TextEditingController harga;
  late TextEditingController stok;
  late TextEditingController deskripsi_produk;

  final authC = Get.find<AuthController>();

  List<String> categories = [
    'Baju',
    'Komputer',
    'Laptop',
    'Game',
  ];

  final kategori = "".obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final imageFile = File("").obs;
  final ambil = false.obs;
  final ext = "".obs;

  final downloadURL = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nama_produk = TextEditingController();
    harga = TextEditingController();
    stok = TextEditingController();
    deskripsi_produk = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nama_produk.dispose();
    harga.dispose();
    stok.dispose();
    deskripsi_produk.dispose();
  }

  void addProduct()async{
    CollectionReference products = firestore.collection('products');

    try{
      String dateNow = DateTime.now().toIso8601String();

      await FirebaseStorage.instance
          .ref('${dateNow}.${ext}')
          .putFile(imageFile.value);

      downloadURL.value = await FirebaseStorage.instance.ref('${dateNow}.${ext}').getDownloadURL();

      await products.add({
        "nama_produk" : nama_produk.text,
        "harga": int.parse(harga.text),
        "stok": int.parse(stok.text),
        "deskripsi": deskripsi_produk.text,
        "kategori": kategori.value,
        "gambar": downloadURL.value,
        "uid_penjual": authC.box.read('uid'),
        "created_at": dateNow,
        "rating": 0
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahkan barang",
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
