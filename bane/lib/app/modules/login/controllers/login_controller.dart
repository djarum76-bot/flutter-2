import 'package:bane/app/controllers/auth_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final key = GlobalKey<FormState>();

  final authC = Get.find<AuthController>();

  late TextEditingController email;
  late TextEditingController password;

  final secure = true.obs;

  final loading = false.obs;
  final loadingG = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  Future<void> check()async {
    final form = key.currentState;
    if (form!.validate()) {
      form.save();
      authC.login(email.text, password.text);
    }
  }
}
