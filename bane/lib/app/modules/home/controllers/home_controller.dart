import 'package:bane/app/controllers/auth_controller_controller.dart';
import 'package:bane/app/controllers/network_controller.dart';
import 'package:bane/app/models/berita_model.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

class HomeController extends GetxController {
  final authC = Get.find<AuthController>();
  final networkC = Get.find<NetworkController>();

  getBerita()async{
    final response = await dio.get('/top-headlines?country=id',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "${apiKEY}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200 && data["status"] == "ok"){
      networkC.berita(BeritaModel.fromJson(data));
      networkC.berita.refresh();
    }
  }
}
