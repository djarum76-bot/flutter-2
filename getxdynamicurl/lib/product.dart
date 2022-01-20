import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdynamicurl/detail.dart';

class ProductPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Product Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.toNamed('/product/1?name=One Piece&rating=10/10');
                },
                child: Text("Product 1")
            ),
            ElevatedButton(
                onPressed: (){
                  Get.toNamed('/product/2?name=Naruto&rating=9/10');
                },
                child: Text("Product 2")
            ),
            ElevatedButton(
                onPressed: (){
                  Get.toNamed('/product/3?name=Gintama&rating=10/10');
                },
                child: Text("Product 3")
            ),
          ],
        ),
      ),
    );
  }
}