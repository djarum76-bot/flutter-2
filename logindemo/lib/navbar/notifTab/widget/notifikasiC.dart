import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/NotifikasiModel.dart';

class NotifikasiC extends GetxController with SingleGetTickerProviderMixin{
  late TabController controller;

  final globalC = Get.find<Global>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    controller.dispose();
  }

  getNotif()async{
    final response = await dio.get('/api/v1/auth/pengguna/notifikasi',
        options: Dio.Options(
            headers:{
              "Authorization" : globalC.box.read('token')
            }
        )
    );

    final data = response.data;

    print(globalC.box.read('token'));

    if(response.statusCode == 200 && data["status"]){
      globalC.notifikasi(NotifikasiModel.fromJson(data));
      globalC.notifikasi.refresh();
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data = response.data;

      globalC.box.write('token', data["access_token"]);
      getNotif();
    }
  }
}