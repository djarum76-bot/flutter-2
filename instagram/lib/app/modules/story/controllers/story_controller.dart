import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/app/data/stories_model.dart';
import 'package:instagram/app/service/auth_controller.dart';
import 'package:story/story_page_view/story_page_view.dart';

class StoryController extends GetxController {
  final authC = Get.find<AuthController>();

  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  final user = <User>[].obs;

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

        user.clear();
        for(int i=0;i<authC.stories.value.user!.length;i++){
          if(authC.stories.value.user![i].storiesCount != 0){
            user.value.add(authC.stories.value.user![i]);
            user.refresh();
          }
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    indicatorAnimationController.dispose();
    super.dispose();
  }
}
