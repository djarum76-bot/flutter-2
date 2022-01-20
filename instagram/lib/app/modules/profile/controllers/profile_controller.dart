import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:instagram/app/data/user_model.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/service/auth_controller.dart';

class ProfileController extends GetxController {
  var user = "User".obs;

  final sorotan = false.obs;

  final authC = Get.find<AuthController>();
  final gambarL = <String>[].obs;
  final gambarC = 0.obs;
  final pp = "".obs;
  final un = "".obs;

  logout()async{
    try{
      final response = await dio.post('/logout',
          options: Dio.Options(
              headers: {
                "Accept": "application/json",
                "Authorization" : "${authC.box.read('token')}"
              }
          )
      );

      final data = response.data;

      if(response.statusCode == 200){
        authC.box.remove('username');
        authC.box.remove('password');
        authC.box.remove('user_id');
        authC.box.remove('token');

        Get.offAllNamed(Routes.LOGIN);

        print("200");
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
          logout();
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
        logout();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }

  getUser()async{
    try{
      final response = await dio.get('/user/${authC.box.read('user_id')}',
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
        authC.user(UserModel.fromJson(data));
        authC.user.refresh();

        gambarC.value = 0;
        gambarL.clear();

        un.value = authC.user.value.user![0].username!;

        if(authC.user.value.user![0].image! == null){
          pp.value = "";
        }else{
          pp.value = authC.user.value.user![0].image!;
        }

        for(int i=0;i<authC.user.value.user![0].postsCount!;i++){
          gambarL.value.add(authC.user.value.user![0].posts![i].image!);
          gambarL.refresh();
        }

        gambarC.value = authC.user.value.user![0].postsCount!;
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
          authC.box.write('token', data2["token"]);
          getUser();
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
        authC.box.write('token', data["token"]);
        getUser();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "${data["message"]}"
        );
      }
    }
  }
}
