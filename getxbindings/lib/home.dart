import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxbindings/count.dart';
import 'package:getxbindings/countC.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
            // onPressed: (){
            //   Get.to(()=>CountPage(),
            //   binding: BindingsBuilder(() {
            //     Get.put(CountC());
            //   }));
            // },

            onPressed: (){
              Get.toNamed('/count-page');
            },

            child: Text("Next")
        ),
      ),
    );
  }
}