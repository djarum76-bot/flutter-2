import 'package:bane/app/controllers/auth_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final key = GlobalKey<FormState>();

  final authC = Get.find<AuthController>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;

  final secure = true.obs;

  final loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
  }

  check(){
    final form = key.currentState;
    if (form!.validate()) {
      form.save();
      authC.register(username.text, email.text, password.text);
    }
  }
}
