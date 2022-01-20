import 'package:get/get.dart';
import 'package:getxstatemanager/models/orang.dart';

class OrangController extends GetxController{
  var orang = Orang(nama: "usopp",umur: 24).obs;

  void changeUpperCase(){
    orang.update((val) {
      orang.value.nama = orang.value.nama.toString().toUpperCase();
    });
  }
}