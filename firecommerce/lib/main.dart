import 'package:firebase_core/firebase_core.dart';
import 'package:firecommerce/app/services/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      theme: ThemeData(
        primaryColor: Color(0xff746bc9),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      initialRoute: authC.box.read('isLogin') == null ? Routes.LOGIN : authC.box.read('isLogin') == true ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
