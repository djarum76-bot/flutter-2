import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/service/auth_controller.dart';

class AddController extends GetxController {
  late TextEditingController body;

  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;

  final authC = Get.find<AuthController>();
  final navbarC = Get.find<NavbarController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    body = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    body.dispose();
  }

  createPost()async{
    String? image = getStringImage(File(selectedImagePath.value));

    Dio.FormData formData = Dio.FormData.fromMap({
      'body': body.text,
      'image': image
    });

    final response = await dio.post('/posts',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "${authC.box.read('token')}"
            }
        ),
        data: formData
    );

    final data = response.data;

    if(response.statusCode == 200){
      body.clear();
      selectedImagePath.value = "";
      navbarC.tabIndex.value = 0;
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  getImage(ImageSource imageSource)async{
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+ " Mb";
    }else{
      Get.snackbar("Error", "No image selected");
    }
  }

  String? getStringImage(File? file){
    if(file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }
}
