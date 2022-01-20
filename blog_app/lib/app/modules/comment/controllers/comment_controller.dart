import 'dart:convert';

import 'package:blog_app/app/data/CommentsModel.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  final authC = Get.find<AuthController>();
  final homeC = Get.find<HomeController>();

  late TextEditingController comment;

  final commentL = <String>[].obs;

  final send = 0.obs;
  final edit = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    comment = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    comment.dispose();
  }

  getComments(int id)async{
    final response = await dio.get('/posts/${id}/comments',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.comments(CommentsModel.fromJson(data));
      authC.comments.refresh();

      commentL.clear();
      for(int i=0;i<authC.comments.value.post!.length;i++){
        commentL.value.add(authC.comments.value.post![i].comment!);
        commentL.refresh();
      }
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  createComments(int id)async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'comment':comment.text,
    });

    final response = await dio.post('/posts/${id}/comments',
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
      comment.text = "";
      comment.clear();
      getComments(id);
      homeC.getPosts();
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  deleteComment(int idC, int idP)async{
    final response = await dio.delete('/comments/${idC}',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      getComments(idP);
      homeC.getPosts();
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  editComment(int id)async{
    var params =  {
      "comment": comment.text,
    };


    final response = await dio.put('/comments/${id}',
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
      comment.text = "";
      comment.clear();
      getComments(id);
      send.value = 0;
      edit.value = 0;
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
