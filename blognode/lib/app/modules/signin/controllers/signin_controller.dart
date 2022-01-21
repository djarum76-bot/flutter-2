import 'dart:convert';

import 'package:blognode/app/routes/app_pages.dart';
import 'package:blognode/app/services/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final secure = true.obs;

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  final authC = Get.find<AuthController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  check() {
    final form = globalkey.currentState;
    if (form!.validate()) {
      form.save();
      login();
    }
  }

  login()async{
    var params =  {
      "username": usernameController.text,
      "password": passwordController.text
    };

    final response = await dio.post("/user/login",
        data: jsonEncode(params)
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.box.write('token', "Bearer ${data["token"]}");
      authC.box.write('username', "${data["data"]["username"]}");
      Get.offAllNamed(Routes.NAVBAR);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["status"]}"
      );
    }
  }
}
