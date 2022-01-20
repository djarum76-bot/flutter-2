import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigation/page4.dart';

class PageTiga extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Tiga"),
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
                },
                child: Text("Back Page")
            ),
            ElevatedButton(
                onPressed: (){
                  // navigator!.push(MaterialPageRoute(builder: (_){
                  //   return PageEmpat();
                  // }));

                  // Get.to(() => PageEmpat()); //push

                  Get.toNamed("/page4"); //push pakai nama
                },
                child: Text("Next Page")
            )
          ],
        ),
      ),
    );
  }
}