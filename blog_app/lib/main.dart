import 'package:blog_app/app/service/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main()async{
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget{
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: authC.box.read('token') == null ? Routes.LOGIN : Routes.NAVBAR,
      getPages: AppPages.routes,
    );
  }
}
