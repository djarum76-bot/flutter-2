import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/user_model.dart';
import 'package:logindemo/navbar/navbar.dart';

class LoginPageC extends GetxController{
  final eValidator = RequiredValidator(errorText: 'Harap Masukkan Username');
  final pValidator = RequiredValidator(errorText: 'Harap Masukkan Password');
  final formKey = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController password;

  final globalC = Get.find<Global>();

  check(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      login();
    }
  }


  login()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'username':username.text,
      'password':password.text
    });

    final response = await dio.post('/api/v1/auth/login',data: formData);

    final data = response.data;

    if(response.statusCode == 200){
      final responseUser = await dio.get('/api/v1/auth/pengguna/data',
          options: Dio.Options(
              headers:{
                "Authorization" : data["access_token"]
              }
          )
      );

      final dataUser = responseUser.data;

      if(response.statusCode == 200 && dataUser["status"]){
        globalC.user(UserModel.fromJson(dataUser));
        globalC.user.refresh();

        if(globalC.user.value.data!.role == "Admin"){
          username.clear();
          password.clear();
          Get.defaultDialog(title: "Error", middleText: "User Tidak Bisa Login");
        }else if(globalC.user.value.data!.status == "Tidak Aktif"){
          username.clear();
          password.clear();
          Get.defaultDialog(title: "Error", middleText: "User Tidak Bisa Login");
        }else{
          globalC.box.write('token', data["access_token"]);
          globalC.box.write('username', username.text);
          globalC.box.write('password', password.text);
          globalC.box.write('autologin', true);
          username.clear();
          password.clear();
          Get.off(() => NavBar());
        }
      }
    }else{
      print(data["status"]);
    }
  }

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
    username.dispose();
    password.dispose();
    username.clear();
    password.clear();
  }
}