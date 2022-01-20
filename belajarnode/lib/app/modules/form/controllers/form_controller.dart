import 'dart:convert';

import 'package:belajarnode/app/routes/app_pages.dart';
import 'package:belajarnode/app/services/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  late TextEditingController username;
  late TextEditingController name;
  late TextEditingController lastname;
  late TextEditingController mail;
  late TextEditingController randomstr;
  late TextEditingController hash;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
    name = TextEditingController();
    lastname = TextEditingController();
    mail = TextEditingController();
    randomstr = TextEditingController();
    hash = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    name.dispose();
    lastname.dispose();
    mail.dispose();
    randomstr.dispose();
    hash.dispose();
  }

  addUser()async{
    var params =  {
      'username': username.text,
      'name': name.text,
      'lastname': lastname.text,
      'mail': mail.text,
      'randomstr': randomstr.text,
      'hash': hash.text,
    };

    final response = await dio.post('/user',
        options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            }
        ),
        data: jsonEncode(params)
    );

    if(response.statusCode == 200){
      Get.offAllNamed(Routes.HOME);
    }
  }
}
