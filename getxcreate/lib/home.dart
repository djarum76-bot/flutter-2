import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcreate/shop.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            OutlinedButton(
                onPressed: (){
                  Get.to(() => ShopPage());
                },
                child: Text("Shop")
            )
          ],
        ),
      ),
    );
  }
}