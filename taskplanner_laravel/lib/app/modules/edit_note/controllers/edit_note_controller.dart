import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/models/note_models.dart';
import 'package:taskplanner/app/modules/detail_note/controllers/detail_note_controller.dart';
import 'package:taskplanner/app/modules/home/controllers/home_controller.dart';
import 'package:taskplanner/app/modules/note/controllers/note_controller.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class EditNoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController content;

  final authC = Get.find<AuthController>();
  final noteC = Get.find<NoteController>();
  final homeC = Get.find<HomeController>();
  final detailNoteC = Get.find<DetailNoteController>();

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

  getNote()async{
    final response = await dio.get('/notes/${Get.arguments}',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.note(NoteModel.fromJson(data));
      authC.note.refresh();

      title.text = authC.note.value.note![0].title!;
      content.text = authC.note.value.note![0].content!;
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
        getNote();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  editNote()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'title':title.text,
      'content':content.text
    });

    var params = {
      'title':title.text,
      'content':content.text
    };

    final response = await dio.put('/notes/${Get.arguments}',
        data: jsonEncode(params),
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      await noteC.getNotes();
      await homeC.getNotes();
      await detailNoteC.getNote();
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
        editNote();
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
