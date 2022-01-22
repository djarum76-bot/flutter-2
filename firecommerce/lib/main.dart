import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      theme: ThemeData(
        primaryColor: Color(0xff746bc9),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
