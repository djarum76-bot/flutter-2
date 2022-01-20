import 'package:blog_app/app/data/UserModel.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final authC = Get.find<AuthController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    email.dispose();
    password.dispose();
  }

  check(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      login();
    }
  }

  login()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'email':email.text,
      'password':password.text
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
      print(data["token"]);
      print(data["user"]["id"]);

      authC.box.write('email', email.text);
      authC.box.write('password', password.text);
      authC.box.write('token', data["token"]);
      authC.box.write('user_id', data["user"]["id"]);

      Get.offAllNamed(Routes.NAVBAR);
    }else{
      Get.defaultDialog(
        title: "Error",
        middleText: "${data["message"]}"
      );
    }
  }
}
