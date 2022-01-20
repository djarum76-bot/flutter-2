import 'package:get/get.dart';
import 'package:getx/models/orang.dart';

class OrangController extends GetxController{
  // var orang = Orang();
  //
  // void changeUpperCase(){
  //   orang.nama.value = orang.nama.value.toUpperCase();
  // }

  var orang = Orang(nama: "kurama", umur: 15).obs;

  void changeUpperCase(){
    orang.update((_) {
      orang.value.nama = orang.value.nama.toString().toUpperCase();
    });
  }
}