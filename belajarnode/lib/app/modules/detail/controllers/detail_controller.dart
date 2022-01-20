import 'package:belajarnode/app/data/user.dart';
import 'package:belajarnode/app/routes/app_pages.dart';
import 'package:belajarnode/app/services/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final authC = Get.find<AuthController>();

  getUser(int id)async{
    final response = await dio.get('/user/${id}',
        options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      print(data);
      authC.user(UserModel.fromJson(data));
      authC.user.refresh();
    }
  }

  deleteUser(int id)async{
    final response = await dio.delete('/user/${id}',
        options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      Get.offAllNamed(Routes.HOME);
    }
  }
}
