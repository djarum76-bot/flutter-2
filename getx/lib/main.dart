import 'package:flutter/material.dart';
import 'package:getx/controllers/counter_controller.dart';
import 'package:getx/controllers/orang_controller.dart';
import 'package:getx/home_page.dart';
import 'package:get/get.dart';
import 'package:getx/models/orang.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: GetBuilder<CounterController>(
              init: CounterController(),
              builder: (controller) => Text(
                  "Angka ${controller.count}",
                  style: TextStyle(fontSize: 35)
              )
          )
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Get.find<CounterController>().increment();
            }
        ),
      ),
    );
  }
}