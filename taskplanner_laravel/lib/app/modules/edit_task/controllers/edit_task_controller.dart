import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/custom/simply_format.dart';
import 'package:taskplanner/app/custom/time_of_day.dart';
import 'package:taskplanner/app/models/task_model.dart';
import 'package:taskplanner/app/modules/detail_task/controllers/detail_task_controller.dart';
import 'package:taskplanner/app/modules/home/controllers/home_controller.dart';
import 'package:taskplanner/app/modules/task/controllers/task_controller.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class EditTaskController extends GetxController {
  late TextEditingController title;
  late TextEditingController date;
  late TextEditingController time;
  late TextEditingController desc;

  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;

  final tgl = "".obs;
  final waktu = "".obs;

  final selectedDateAndTime = DateTime.now().obs;

  final authC = Get.find<AuthController>();
  final taskC = Get.find<TaskController>();
  final homeC = Get.find<HomeController>();
  final detailTaskC = Get.find<DetailTaskController>();

  void onTimeChanged(TimeOfDay newTime) {
    selectedTime.value = newTime;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title = TextEditingController();
    date = TextEditingController();
    time = TextEditingController();
    desc = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    time.dispose();
    date.dispose();
    desc.dispose();
  }

  getTask()async{
    final response = await dio.get('/task/${Get.arguments}',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.task(TaskModel.fromJson(data));
      authC.task.refresh();

      title.text = authC.task.value.task![0].title!;

      selectedDate.value = authC.task.value.task![0].tanggal!;
      tgl.value = simplyFormat(time: selectedDate.value);

      selectedTime.value = stringToTimeOfDay(authC.task.value.task![0].waktu!);

      selectedDateAndTime.value = authC.task.value.task![0].date!;

      desc.text = authC.task.value.task![0].deskripsi!;
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
        getTask();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  editTask()async{
    Dio.FormData formData = Dio.FormData.fromMap({
      'title':title.text,
      'date':selectedDateAndTime.value,
      'tanggal':tgl.value,
      'waktu':waktu.value,
      'deskripsi':desc.text
    });

    var params = {
      'title':title.text,
      'date':selectedDateAndTime.value.toIso8601String(),
      'tanggal':tgl.value,
      'waktu':waktu.value,
      'deskripsi':desc.text
    };

    final response = await dio.put('/task/${Get.arguments}',
        data: jsonEncode(params),
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
      await detailTaskC.getTask();
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
        editTask();
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
