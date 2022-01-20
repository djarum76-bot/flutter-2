import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxbindings/count.dart';
import 'package:getxbindings/countB.dart';
import 'package:getxbindings/countC.dart';
import 'package:getxbindings/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home-page',
      getPages: [
        GetPage(name: '/home-page', page: () => HomePage()),
        GetPage(name: '/count-page', page: () => CountPage(),
        binding: CountB()),
      ],

      // getPages: [
      //   GetPage(name: '/home-page', page: () => HomePage()),
      //   GetPage(name: '/count-page', page: () => CountPage(),
      //       binding: BindingsBuilder(() {
      //         Get.put(CountC());
      //       })),
      // ],
    );
  }
}