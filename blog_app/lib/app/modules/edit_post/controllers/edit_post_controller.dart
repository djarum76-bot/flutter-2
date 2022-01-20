import 'dart:convert';

import 'package:blog_app/app/data/PostModel.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPostController extends GetxController {
  late TextEditingController body;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  getPost(int id)async{
    final response = await dio.get('/posts/${id}',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.post(PostModel.fromJson(data));
      authC.post.refresh();

      body.text = authC.post.value.post![0].body!;
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  check(){
    final form = formKey.currentState;
    if(form!.validate()){
      form.save();
      editPost(Get.arguments);
    }
  }

  editPost(int id)async{
    var params =  {
      "body": body.text,
    };


    final response = await dio.put('/posts/${id}',
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
      print(data);
      Get.offAllNamed(Routes.NAVBAR);
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
