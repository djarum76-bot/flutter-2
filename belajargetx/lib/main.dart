import 'package:belajargetx/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
      home: HomePage(),
      theme: counterC.isDark.value ? ThemeData.dark(): ThemeData.light(),
    ));
  }
}

class HomePage extends StatelessWidget{
  final c = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(() => Text(
          "ANGKA ${c.counter.value}",
          style: TextStyle(fontSize: 35),
        ))
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            c.increment();
            c.changeTheme();
          }
      ),
    );
  }
}