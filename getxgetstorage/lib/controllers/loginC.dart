import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginC extends GetxController{
  late TextEditingController emailC;
  late TextEditingController passC;

  var hidden = true.obs;
  var rememberMe = false.obs;

  @override
  void onInit(){
    super.onInit();
    emailC = TextEditingController();
    passC = TextEditingController();
    final box = GetStorage();
    if(box.read('dataUser') != null){
      final data = box.read('dataUser') as Map<String, dynamic>;
      emailC.text = data['email'];
      passC.text = data['password'];
      rememberMe.value = data['rememberMe'];
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}