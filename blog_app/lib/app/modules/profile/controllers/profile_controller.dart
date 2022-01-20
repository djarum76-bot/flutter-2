import 'dart:convert';
import 'dart:io';

import 'package:blog_app/app/data/UserModel.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final authC = Get.find<AuthController>();

  late TextEditingController nama;

  final imageFile = File("").obs;
  final picker = ImagePicker();
  final gambarA = "".obs;

  final gambarN = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nama = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nama.dispose();
  }

  getUserDetail()async{
    final response = await dio.get('/user',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.user(UserModel.fromJson(data));
      authC.user.refresh();

      gambarN.value = authC.user.value.user!.image!;
      nama.text = authC.user.value.user!.name!;
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  editUser()async{
    try{
      String? image = gambarA.value == "".obs ? "" : getStringImage(imageFile.value);

      var params =  {
        "name": nama.text,
        "image": image
      };


      final response = await dio.put('/user',
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}"
              }
          ),
          data: jsonEncode(params)
      );

      final data = response.data;

      if(response.statusCode == 200){
        getUserDetail();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }catch(e){
      print(e);
    }
  }

  getImage()async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if(pickedFile != null){
      gambarA.value = "a";
      imageFile.value = File(pickedFile.path);
    }
  }

  String? getStringImage(File? file){
    if(file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }

  logout()async{
    final response = await dio.post('/logout',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.box.remove('token');
      authC.box.remove('email');
      authC.box.remove('password');
      authC.box.remove('user_id');

      Get.offAllNamed(Routes.LOGIN);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
