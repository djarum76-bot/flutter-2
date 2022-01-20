import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/app/data/user_model.dart';
import 'package:instagram/app/modules/profile/controllers/profile_controller.dart';
import 'package:instagram/app/service/auth_controller.dart';

class EditProfileController extends GetxController {
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;

  late TextEditingController username;

  final authC = Get.find<AuthController>();
  final profileC = Get.find<ProfileController>();

  final pp = "".obs;

  getUser()async{
    try{
      final response = await dio.get('/user/${authC.box.read('user_id')}',
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

        if(authC.user.value.user![0].image! == null){
          pp.value = "";
        }else{
          pp.value = authC.user.value.user![0].image!;
        }

        username.text = authC.user.value.user![0].username!;
      }else{
        Dio.FormData formData = Dio.FormData.fromMap({
          'username':authC.box.read('username'),
          'password':authC.box.read('password')
        });

        final response2 = await dio.post('/login',
            data: formData,
            options: Dio.Options(
                headers: {
                  "Accept": "application/json"
                }
            )
        );

        final data2 = response2.data;

        if(response2.statusCode == 200){
          authC.box.write('user_id', data2["user"]["id"]);
          authC.box.write('token', data2["token"]);
          getUser();
        }else{
          Get.defaultDialog(
              title: "Error",
              middleText: "${data["message"]}"
          );
        }
      }
    }on Dio.DioError catch(e){
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':authC.box.read('username'),
        'password':authC.box.read('password')
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
        authC.box.write('user_id', data["user"]["id"]);
        authC.box.write('token', data["token"]);
        getUser();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }

  editProfile()async{
    try{
      String? image = getStringImage(File(selectedImagePath.value));

      // Dio.FormData formDataEdit = Dio.FormData.fromMap({
      //   'username': username.text,
      //   'image': image
      // });

      var params =  {
        'username': username.text,
        'image': image
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
        authC.box.write('username', username.text);
        profileC.getUser();
        getUser();
        Get.back();
      }else{
        Dio.FormData formData = Dio.FormData.fromMap({
          'username':authC.box.read('username'),
          'password':authC.box.read('password')
        });

        final response2 = await dio.post('/login',
            data: formData,
            options: Dio.Options(
                headers: {
                  "Accept": "application/json"
                }
            )
        );

        final data2 = response2.data;

        if(response2.statusCode == 200){
          authC.box.write('user_id', data2["user"]["id"]);
          authC.box.write('token', data2["token"]);
          editProfile();
        }else{
          Get.defaultDialog(
              title: "Error",
              middleText: "${data["message"]}"
          );
        }
      }
    }on Dio.DioError catch(e){
      print(e.toString());
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':authC.box.read('username'),
        'password':authC.box.read('password')
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
        authC.box.write('user_id', data["user"]["id"]);
        authC.box.write('token', data["token"]);
        editProfile();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    username.clear();
  }
}
