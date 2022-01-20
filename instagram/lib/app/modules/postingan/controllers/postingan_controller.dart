import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:instagram/app/data/post_model.dart';
import 'package:instagram/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:instagram/app/modules/profile/controllers/profile_controller.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/service/auth_controller.dart';

class PostinganController extends GetxController {
  final authC = Get.find<AuthController>();
  final navbarC = Get.find<NavbarController>();
  final profileC = Get.find<ProfileController>();

  final liked = false.obs;
  final likeC = 0.obs;
  final comment = 0.obs;
  final temp = false.obs;

  getPost(int id)async{
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

        likeC.value = 0;
        comment.value = 0;

        likeC.value = authC.post.value.post![0].likesCount!;
        comment.value = authC.post.value.post![0].commentsCount!;

        if(authC.post.value.post![0].likes!.isEmpty || authC.post.value.post![0].likes!.length == 0){
          liked.value = false;
        }else{
          liked.value = true;
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
          getPost(id);
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
        getPost(id);
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }

  deletePost(int id)async{
    try{
      final response = await dio.delete('/posts/${id}',
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}"
              }
          )
      );

      final data = response.data;

      if(response.statusCode == 200){
        // Get.offAllNamed(Routes.NAVBAR);
        // navbarC.tabIndex.value = 2;
        profileC.getUser();
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
          getPost(id);
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
        getPost(id);
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
        getPost(id);
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
          getPost(id);
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
        getPost(id);
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }
}
