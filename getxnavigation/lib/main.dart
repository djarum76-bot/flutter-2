import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigation/page1.dart';
import 'package:getxnavigation/page2.dart';
import 'package:getxnavigation/page3.dart';
import 'package:getxnavigation/page4.dart';
import 'package:getxnavigation/page5.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/page1",
      getPages: [
        GetPage(name: "/page1", page: () => PageSatu()),
        GetPage(name: "/page2", page: () => PageDua()),
        GetPage(name: "/page3", page: () => PageTiga()),
        GetPage(name: "/page4", page: () => PageEmpat()),
        GetPage(name: "/page5", page: () => PageLima()),
      ],
    );
  }
}