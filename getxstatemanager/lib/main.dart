import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatemanager/controllers/counter_controller.dart';
import 'package:getxstatemanager/controllers/orang_controller.dart';
import 'package:getxstatemanager/models/orang.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final countC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: GetBuilder<CounterController>(
              // init: CounterController(),
              builder: (controller){
                return Text(
                  "Angka ${controller.count}",
                  style: TextStyle(fontSize: 35),
                );
              }
          )
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              countC.increment();
            }
        ),
      ),
    );
  }
}