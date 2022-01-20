import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/app/data/posts_model.dart';
import 'package:instagram/app/data/stories_model.dart';
import 'package:instagram/app/service/auth_controller.dart';

class HomeController extends GetxController {
  final authC = Get.find<AuthController>();

  final liked = <bool>[].obs;
  final likeC = <int>[].obs;
  final comment = <int>[].obs;
  // final pp = <String>[].obs;
  // final un = <String>[].obs;
  final temp = false.obs;

  getStories()async{
    try{
      final response = await dio.get('/stories',
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}"
              }
          )
      );

      final data = response.data;

      if(response.statusCode == 200){
        print(authC.box.read('token'));
        authC.stories(StoriesModel.fromJson(data));
        authC.stories.refresh();
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
          getStories();
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
        getStories();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }

  getPosts()async{
    try{
      final response = await dio.get('/posts',
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}"
              }
          )
      );

      final data = response.data;

      if(response.statusCode == 200){
        print(authC.box.read('token'));
        authC.posts(PostsModel.fromJson(data));
        authC.posts.refresh();

        likeC.clear();
        liked.clear();
        comment.clear();
        // pp.clear();
        // un.clear();
        for(int i=0; i<authC.posts.value.posts!.length; i++){
          if(authC.posts.value.posts![i].likes!.isEmpty){
            liked.value.add(false);
            liked.refresh();
          }else{
            temp.value = false;
            for(int j=0; j<authC.posts.value.posts![i].likes!.length; j++){
              if(authC.posts.value.posts![i].likes![j].userId == authC.box.read('user_id')){
                temp.value = true;
                break;
              }else{
                temp.value = false;
              }
            }
            liked.value.add(temp.value);
            liked.refresh();
          }
          likeC.value.add(authC.posts.value.posts![i].likesCount!);
          likeC.refresh();

          comment.value.add(authC.posts.value.posts![i].commentsCount!);
          comment.refresh();

          // pp.value.add(authC.posts.value.posts![i].user!.image!);
          // pp.refresh();

          // un.value.add(authC.posts.value.posts![i].user!.username!);
          // un.refresh();
        }
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
          getPosts();
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
        getPosts();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }

  likeUnlike(int id)async{
    try{
      final response = await dio.post('/posts/${id}/likes',
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}"
              }
          )
      );

      final data = response.data;

      if(response.statusCode == 200){
        getPosts();
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
          getPosts();
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
        getPosts();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }
}
