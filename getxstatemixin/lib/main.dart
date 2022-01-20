import 'package:flutter/material.dart';
import 'package:getxstatemixin/home.dart';
import 'package:get/get.dart';
import 'package:getxstatemixin/myB.dart';
import 'package:getxstatemixin/myC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialBinding: MyB(),
    );
  }
}