import 'package:blog_app/app/routes/app_pages.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController password_confirmation;

  final authC = Get.find<AuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    password_confirmation = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.dispose();
    email.dispose();
    password.dispose();
    password_confirmation.dispose();
  }

  check(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      register();
    }
  }

  register()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'name':name.text,
      'email':email.text,
      'password':password.text,
      'password_confirmation':password_confirmation.text
    });

    final response = await dio.post('/register',
        data: formData,
        options: Dio.Options(
            headers: {
              "Accept": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      Get.offAllNamed(Routes.LOGIN);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
