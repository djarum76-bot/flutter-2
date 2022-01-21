import 'dart:convert';

import 'package:blognode/app/routes/app_pages.dart';
import 'package:blognode/app/services/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final secure = true.obs;

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final authC = Get.find<AuthController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  check() {
    final form = globalkey.currentState;
    if (form!.validate()) {
      form.save();
      register();
    }
  }

  register()async{
    try{
      var params =  {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text
      };

      final response = await dio.post("/user/register",
          data: jsonEncode(params)
      );

      final data = response.data;

      if(response.statusCode == 200){
        var paramsLogin =  {
          "username": usernameController.text,
          "password": passwordController.text
        };

        final responseLogin = await dio.post("/user/login",
            data: jsonEncode(paramsLogin)
        );

        final dataLogin = responseLogin.data;

        if(responseLogin.statusCode == 200){
          authC.box.write('token', "Bearer ${dataLogin["token"]}");
          authC.box.write('username', "${dataLogin["data"]["username"]}");
          Get.offAllNamed(Routes.NAVBAR);
        }else{
          Get.defaultDialog(
              title: "Error",
              middleText: "${dataLogin["status"]}"
          );
        }
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["status"]}"
        );
      }
    }on Dio.DioError catch(e){
      Get.defaultDialog(
          title: "Error",
          middleText: "Akun sudah ada"
      );
    }
  }
}
