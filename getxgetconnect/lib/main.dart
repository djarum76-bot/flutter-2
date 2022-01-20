import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgetconnect/controllers/usersC.dart';
import 'package:getxgetconnect/pages/home_page.dart';
import 'package:getxgetconnect/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userC = Get.put(UsersC());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: AppPages.pages,
    );
  }
}