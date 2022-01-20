import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/user_model.dart';
import 'package:logindemo/navbar/profile/profileC.dart';

class NavBarC extends GetxController{
  final currentIndex = 0.obs;

  final globalC = Get.find<Global>();

  void pindahTab(int index){
    currentIndex.value = index;
  }

  getUser()async{
    final response = await dio.get('/api/v1/auth/pengguna/data',
        options: Dio.Options(
            headers:{
              "Authorization" : globalC.box.read('token')
            }
        )
    );

    final data = response.data;

    print(globalC.box.read('token'));

    if(response.statusCode == 200 && data["status"]){
      globalC.user(UserModel.fromJson(data));
      globalC.user.refresh();
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data = response.data;

      globalC.box.write('token', data["access_token"]);
      getUser();
    }
  }
}