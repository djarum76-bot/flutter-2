import 'package:dio/dio.dart' as Dio;
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/models/tasks_model.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class TaskController extends GetxController {
  //TODO: Implement TaskController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  final authC = Get.find<AuthController>();

  final tanggal = <DateTime>[].obs;
  final jumlah = 0.obs;

  getTasks()async{
    final response = await dio.get('/tasksdate',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.tasks(TasksModel.fromJson(data));
      authC.tasks.refresh();

      jumlah.value = authC.tasks.value.tasks!.length;
      tanggal.clear();

      for(int i=0;i<authC.tasks.value.tasks!.length;i++){
        tanggal.add(authC.tasks.value.tasks![i].tanggal!);
        tanggal.refresh();
      }
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':authC.box.read('username'),
        'password':authC.box.read('password'),
      });

      final responseLogin = await dio.post('/login',
          data: formData,
          options: Dio.Options(
              headers: {
                "Accept": "application/json"
              }
          )
      );

      final dataLogin = responseLogin.data;

      if(responseLogin.statusCode == 200){
        authC.box.write('token', dataLogin["token"]);
        getTasks();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }
}
