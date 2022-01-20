import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final countC = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: GetX<CountController>(
                builder: (_){
                  return Text(
                    "Angka ${countC.count.value}",
                    style: TextStyle(fontSize: 35),
                  );
                }
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            countC.add();
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class CountController extends GetxController{
  var count = 0.obs;

  void add(){
    count.value++;
  }
}