import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/service/auth_controller.dart';

class RegisterController extends GetxController {
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController password_confirmation;
  late TextEditingController email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
    password_confirmation = TextEditingController();
    email = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    username.clear();
    password.clear();
    password_confirmation.clear();
    email.clear();
  }

  check(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      loading.value = true;
      register();
    }
  }

  register()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'username':username.text,
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
      loading.value = false;
      Get.offAllNamed(Routes.LOGIN);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
