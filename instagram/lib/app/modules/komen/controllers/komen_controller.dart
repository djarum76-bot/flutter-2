import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/app/data/post_model.dart';
import 'package:instagram/app/modules/home/controllers/home_controller.dart';
import 'package:instagram/app/modules/postingan/controllers/postingan_controller.dart';
import 'package:instagram/app/service/auth_controller.dart';

class KomenController extends GetxController {
  final authC = Get.find<AuthController>();
  final homeC = Get.find<HomeController>();
  final postinganC = Get.find<PostinganController>();

  late TextEditingController comment;
  // final commentL = <String>[].obs;
  // final jumlahKomen = 0.obs;
  // final pp = <String>[].obs;
  // final un = <String>[].obs;
  // final dt = <DateTime>[].obs;

  final komen = <Comment>[].obs;

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
    try{
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

        komen.clear();

        for(int i=0;i<authC.post.value.post![0].comments!.length;i++){
          komen.value.add(authC.post.value.post![0].comments![i]);
          komen.refresh();
        }

        // jumlahKomen.value = 0;
        // jumlahKomen.value = authC.post.value.post![0].comments!.length;
        //
        // commentL.clear();
        // // pp.clear();
        // // un.clear();
        // dt.clear();
        // for(int i=0;i<jumlahKomen.value;i++){
        //   commentL.value.add(authC.post.value.post![0].comments![i].comment!);
        //   // pp.value.add(authC.post.value.post![0].comments![i].user!.image!);
        //   // un.value.add(authC.post.value.post![0].comments![i].user!.username!);
        //   dt.value.add(authC.post.value.post![0].comments![i].createdAt!);
        //   commentL.refresh();
        //   // pp.refresh();
        //   // un.refresh();
        //   dt.refresh();
        // }
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
          getComments(id);
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
        getComments(id);
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }

  createComment(int id)async{
    try{
      Dio.FormData formDataKomen = Dio.FormData.fromMap({
        'comment':comment.text,
      });

      final response = await dio.post('/posts/${id}/comments',
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}"
              }
          ),
          data: formDataKomen
      );

      final data = response.data;

      if(response.statusCode == 200){
        comment.text = "";
        comment.clear();
        getComments(id);
        homeC.getPosts();
        postinganC.getPost(id);
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
          createComment(id);
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
        createComment(id);
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }
}
