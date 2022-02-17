import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resep/app/controllers/service_controller.dart';
import 'package:resep/app/custom/material_color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final service = Get.put(ServiceController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: Routes.DASHBOARD,
      theme: ThemeData(
        primaryColor: Color(0xFFFFAB73),
        primarySwatch: createMaterialColor(Color(0xFFFFAB73)),
        scaffoldBackgroundColor: Color(0xFFE3FDFD)
      ),
      getPages: AppPages.routes,
    );
  }
}
