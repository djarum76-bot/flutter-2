import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nodejs/app/routes/app_pages.dart';
import 'package:nodejs/app/services/auth_controller.dart';

class RegisterController extends GetxController {
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController role;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    password = TextEditingController();
    email = TextEditingController();
    username = TextEditingController();
    role = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    password.dispose();
    email.dispose();
    username.dispose();
    role.dispose();
  }

  register()async{
    var params =  {
      'username': username.text,
      'email': email.text,
      'password': password.text,
      'role': role.text,
    };

    final response = await dio.post('/register',
        options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            }
        ),
        data: jsonEncode(params)
    );

    if(response.statusCode == 200){
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
