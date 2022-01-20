import 'dart:convert';
import 'dart:io';

import 'package:blognode/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:blognode/app/routes/app_pages.dart';
import 'package:blognode/app/services/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CreateProfileController extends GetxController {
  var selectedImagePath = "".obs;
  final pp = "".obs;

  final globalkey = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController profession;
  late TextEditingController dob;
  late TextEditingController title;
  late TextEditingController about;
  // final ImagePicker picker = ImagePicker();
  // Rx<PickedFile> imageFile = PickedFile("").obs;
  // final foto = "".obs;

  final authC = Get.find<AuthController>();
  final navbarC = Get.find<NavbarController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    name = TextEditingController();
    profession = TextEditingController();
    dob = TextEditingController();
    title = TextEditingController();
    about = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    profession.dispose();
    dob.dispose();
    title.dispose();
    about.dispose();
  }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await picker.getImage(
  //     source: source,
  //   );
  //   foto.value = "1";
  //   imageFile.value = pickedFile!;
  // }

  getImage(ImageSource imageSource)async{
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if(pickedFile != null){
      pp.value = "1";
      selectedImagePath.value = basename(selectedImagePath.value).replaceAll('-', '');
    }else{
      Get.snackbar("Error", "No image selected");
    }
  }

  String? getStringImage(File? file){
    if(file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }

  check() {
    final form = globalkey.currentState;
    if (form!.validate()) {
      form.save();
      addProfile();
    }
  }

  addProfile()async{
    try{
      String? image = basename(selectedImagePath.value).replaceAll('-', '');

      print(image);

      var params =  {
        "name": name.text,
        "profession": profession.text,
        "DOB": dob.text,
        "titleline": title.text,
        "about": about.text,
        "img": image,
      };

      final response = await dio.post("/profile/add",
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
        navbarC.tabIndex.value = 1;
        Get.offAllNamed(Routes.NAVBAR);
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["status"]}"
        );
      }
    }on Dio.DioError catch(e){
      print(e);
    }
  }
}
