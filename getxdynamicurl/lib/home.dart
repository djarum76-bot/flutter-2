import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdynamicurl/product.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Get.toNamed('/product');
            },
            child: Text("All Product")
        ),
      ),
    );
  }
}