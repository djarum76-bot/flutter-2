import 'package:belajarnode/app/data/users.dart';
import 'package:belajarnode/app/services/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final authC = Get.find<AuthController>();

  getAllUser()async{
    final response = await dio.get('/user',
        options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.users(UsersModel.fromJson(data));
      authC.users.refresh();
    }
  }
}
