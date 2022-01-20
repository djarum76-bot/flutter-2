import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdynamicurl/detail.dart';
import 'package:getxdynamicurl/home.dart';
import 'package:getxdynamicurl/product.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/product', page: () => ProductPage()),
        GetPage(name: '/product/:id?', page: () => DetailPage()),
      ],
    );
  }
}