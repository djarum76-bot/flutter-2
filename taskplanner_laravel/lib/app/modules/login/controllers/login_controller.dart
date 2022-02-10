import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final obscure = true.obs;

  late TextEditingController username;
  late TextEditingController password;

  final authC = Get.find<AuthController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    password.dispose();
  }

  login()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'username':username.text,
      'password':password.text,
    });

    final response = await dio.post('/login',
        data: formData,
        options: Dio.Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.box.write('token', data["token"]);
      authC.box.write('username', username.text);
      authC.box.write('password', password.text);
      Get.offAllNamed(Routes.HOME);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
