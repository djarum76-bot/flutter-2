import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/services/auth_controller.dart';

void main()async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: authC.box.read('token') == null ? Routes.LOGIN : Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
