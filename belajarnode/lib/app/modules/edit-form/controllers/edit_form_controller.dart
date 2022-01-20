import 'dart:convert';

import 'package:belajarnode/app/data/user.dart';
import 'package:belajarnode/app/routes/app_pages.dart';
import 'package:belajarnode/app/services/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditFormController extends GetxController {
  late TextEditingController username;
  late TextEditingController name;
  late TextEditingController lastname;
  late TextEditingController mail;
  late TextEditingController randomstr;
  late TextEditingController hash;

  final authC = Get.find<AuthController>();

  getUser(int id)async{
    final response = await dio.get('/user/${id}',
        options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.user(UserModel.fromJson(data));
      authC.user.refresh();

      username.text = authC.user.value.user![0].username!;
      name.text = authC.user.value.user![0].name!;
      lastname.text = authC.user.value.user![0].lastname!;
      mail.text = authC.user.value.user![0].mail!;
      randomstr.text = authC.user.value.user![0].randomstr!;
      hash.text = authC.user.value.user![0].hash!;
    }
  }

  editUser(int id)async{
    var params =  {
      'username': username.text,
      'name': name.text,
      'lastname': lastname.text,
      'mail': mail.text,
      'randomstr': randomstr.text,
      'hash': hash.text,
    };

    final response = await dio.put('/user/${id}',
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
}
