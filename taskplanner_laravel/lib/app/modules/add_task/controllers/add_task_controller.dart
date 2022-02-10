import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/modules/home/controllers/home_controller.dart';
import 'package:taskplanner/app/modules/task/controllers/task_controller.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class AddTaskController extends GetxController {
  late TextEditingController title;
  // late TextEditingController date;
  // late TextEditingController time;
  late TextEditingController desc;

  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;

  final selectedDateAndTime = DateTime.now().obs;

  final tgl = "".obs;
  final waktu = "".obs;

  final authC = Get.find<AuthController>();
  final taskC = Get.find<TaskController>();
  final homeC = Get.find<HomeController>();

  void onTimeChanged(TimeOfDay newTime) {
    selectedTime.value = newTime;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title = TextEditingController();
    desc = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    desc.dispose();
  }

  addTask()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'title':title.text,
      'date':selectedDateAndTime.value,
      'tanggal':tgl.value,
      'waktu':waktu.value,
      'deskripsi':desc.text
    });

    final response = await dio.post('/tasks',
        data: formData,
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      await taskC.getTasks();
      await homeC.getTasks();
      Get.back();
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
        addTask();
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
