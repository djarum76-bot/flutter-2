import 'package:blog_app/app/data/PostsModel.dart';
import 'package:blog_app/app/data/UserModel.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final authC = Get.find<AuthController>();

  final liked = <bool>[].obs;
  final likeC = <int>[].obs;
  final comment = <int>[].obs;
  final temp = false.obs;

  getPosts()async{
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
      authC.posts(PostsModel.fromJson(data));
      authC.posts.refresh();

      likeC.clear();
      liked.clear();
      comment.clear();
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
      }
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  deletePost(int id)async{
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
      getPosts();
    }else{
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }

  likeUnlike(int id)async{
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
      Get.defaultDialog(
          title: "Error",
          middleText: "${data["message"]}"
      );
    }
  }
}
