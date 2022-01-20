import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nodejs/app/routes/app_pages.dart';
import 'package:nodejs/app/services/auth_controller.dart';

class LoginController extends GetxController {
  late TextEditingController password;
  late TextEditingController email;

  final authC = Get.find<AuthController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    password = TextEditingController();
    email = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    password.dispose();
    email.dispose();
  }

  login()async{
    var params =  {
      'email': email.text,
      'password': password.text,
    };

    final response = await dio.post('/login',
        options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            }
        ),
        data: jsonEncode(params)
    );

    final data = response.data;

    if(response.statusCode == 200 && data["success"]){
      authC.box.write('token', "Bearer ${data["token"]}");
      authC.box.write('password', email.text);
      authC.box.write('email', password.text);
      authC.box.write('id', data["user"]);
      Get.offAllNamed(Routes.HOME);
    }
  }
}
