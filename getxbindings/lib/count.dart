import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxbindings/countC.dart';

class CountPage extends StatelessWidget{
  // final countC = Get.put(CountC());
  final countC = Get.find<CountC>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Page"),
      ),
      body: Center(
        child: Obx((){
          return Text(
            "${countC.count.value}",
            style: TextStyle(fontSize: 35),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            countC.add();
          },
          child: Icon(Icons.add),
      ),
    );
  }
}