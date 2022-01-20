import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigation/page5.dart';

class PageEmpat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Empat"),
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
                  //   return PageLima();
                  // }));

                  // Get.to(() => PageLima()); //push

                  Get.toNamed("/page5"); //push pakai nama

                  // Get.offAllNamed("/page5"); //pushreplacementsemuanya pakai nama

                  // Get.offAll(() => PageLima()); //pushreplacementsemuanya
                },
                child: Text("Next Page")
            )
          ],
        ),
      ),
    );
  }
}