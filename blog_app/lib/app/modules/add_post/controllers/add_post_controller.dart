import 'dart:convert';
import 'dart:io';

import 'package:blog_app/app/routes/app_pages.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  late TextEditingController body;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final imageFile = File("asset/placeholder.png").obs;
  final picker = ImagePicker();

  final authC = Get.find<AuthController>();

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

  check(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      createPost();
    }
  }

  createPost()async{
    String? image = imageFile.value == File("asset/placeholder.png").obs ? "" : getStringImage(imageFile.value);

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
      Get.offAllNamed(Routes.NAVBAR);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  getImage()async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if(pickedFile != null){
      imageFile.value = File(pickedFile.path);
    }
  }

  String? getStringImage(File? file){
    if(file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }
}
