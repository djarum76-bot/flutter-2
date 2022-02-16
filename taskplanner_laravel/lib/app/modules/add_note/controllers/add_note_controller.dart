import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/modules/home/controllers/home_controller.dart';
import 'package:taskplanner/app/modules/note/controllers/note_controller.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class AddNoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController content;

  final authC = Get.find<AuthController>();
  final homeC = Get.find<HomeController>();
  final noteC = Get.find<NoteController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title = TextEditingController();
    content = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }
  
  addNote()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'title':title.text,
      'content':content.text
    });

    final response = await dio.post('/notes',
      data: formData,
      options: Dio.Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "${authC.box.read('token')}"
        }
      )
    );

    final data = response.data;

    if(response.statusCode == 200){
      await homeC.getNotes();
      await noteC.getNotes();
      Get.back();
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':authC.box.read('username'),
        'password':authC.box.read('password'),
      });

      final responseLogin = await dio.post('/login',
          data: formData,
          options: Dio.Options(
              headers: {
                "Accept": "application/json"
              }
          )
      );

      final dataLogin = responseLogin.data;

      if(responseLogin.statusCode == 200){
        authC.box.write('token', dataLogin["token"]);
        addNote();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }
}
