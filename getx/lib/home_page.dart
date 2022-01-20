import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/counter_controller.dart';

class HomePage extends StatelessWidget{
  final c = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
                () => Text(
                  "ANGKA ${c.count}",
                  style: TextStyle(fontSize: 35),
                ),
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
          },
          child: Icon(Icons.add),
      ),
    );
  }
}