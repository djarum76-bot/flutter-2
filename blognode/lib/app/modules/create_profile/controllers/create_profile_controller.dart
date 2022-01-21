import 'dart:convert';
import 'dart:io';

import 'package:blognode/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:blognode/app/routes/app_pages.dart';
import 'package:blognode/app/services/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

class CreateProfileController extends GetxController {
  // var selectedImagePath = "".obs;
  final pp = "".obs;

  late TextEditingController name;
  late TextEditingController profession;
  late TextEditingController dob;
  late TextEditingController title;
  late TextEditingController about;
  // final ImagePicker picker = ImagePicker();
  // Rx<PickedFile> imageFile = PickedFile("").obs;
  Rx<File> file = File("").obs;
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
      // selectedImagePath.value = pickedFile.path;
      // imageFile.value = pickedFile;
      file.value = File(pickedFile.path);
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

  // addProfile()async{
  //   var stream = http.ByteStream(DelegatingStream.typed(file.value.openRead()));
  //   var length = await file.value.length();
  //
  //   var uri = Uri.parse("http://192.168.100.175:5000/profile/add");
  //   var request = http.MultipartRequest("POST", uri);
  //
  //   request.fields['name'] = name.text;
  //   request.fields['profession'] = profession.text;
  //   request.fields['DOB'] = dob.text;
  //   request.fields['titleline'] = title.text;
  //   request.fields['about'] = about.text;
  //
  //   request.files.add(
  //       http.MultipartFile(
  //           "img",
  //           stream,
  //           length,
  //           filename: path.basename(file.value.path)
  //       )
  //   );
  //
  //   var response = await request.send();
  //
  //   if(response.statusCode == 200){
  //     navbarC.tabIndex.value = 1;
  //     Get.offAllNamed(Routes.NAVBAR);
  //   }else {
  //     print("Image failed");
  //   }
  //
  // }

  addProfile()async{
    try{
      String fileName = file.value.path.split('/').last;

      var params =  {
        "name": name.text,
        "profession": profession.text,
        "DOB": dob.text,
        "titleline": title.text,
        "about": about.text,
        // "img": imageFile.value.path,
      };

      Dio.FormData formData = Dio.FormData.fromMap({
        "name": name.text,
        "profession": profession.text,
        "DOB": dob.text,
        "titleline": title.text,
        "about": about.text,
        "img": await Dio.MultipartFile.fromFile(file.value.path, filename: path.basename(file.value.path)),
      });

      final response = await dio.post("/profile/add",
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}",
                "Content-type": "multipart/form-data",
              }
          ),
          data: formData
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
