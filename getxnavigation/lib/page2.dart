import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigation/page3.dart';

class PageDua extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Dua"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  // navigator!.pop();
                  Get.back(); //pop
                  // Get.back(result: "INI DARI PAGE 2"); //pop dengan data
                },
                child: Text("Back Page")
            ),
            ElevatedButton(
                onPressed: (){
                  // navigator!.push(MaterialPageRoute(builder: (_){
                  //   return PageTiga();
                  // }));

                  // Get.to(() => PageTiga()); //push
                  Get.toNamed("/page3"); //push pakai nama
                },
                child: Text("Next Page")
            ),
            // Text("${Get.arguments}")
          ],
        ),
      ),
    );
  }
}