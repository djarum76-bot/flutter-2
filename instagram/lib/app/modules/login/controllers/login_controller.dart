import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/service/auth_controller.dart';

class LoginController extends GetxController {
  late TextEditingController username;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final authC = Get.find<AuthController>();
  final loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    username.clear();
    password.clear();
  }

  check(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      loading.value = true;
      login();
    }
  }

  login()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'username':username.text,
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
      loading.value = false;

      authC.box.write('username', username.text);
      authC.box.write('password', password.text);
      authC.box.write('token', data["token"]);
      authC.box.write('user_id', data["user"]["id"]);

      print(data["token"]);

      Get.offAllNamed(Routes.NAVBAR);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
