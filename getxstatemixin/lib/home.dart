import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatemixin/myC.dart';

class HomePage extends GetView<MyC>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: controller.obx((state){
          return Column(
            children: [
              Text("${state!["first_name"] + state["last_name"]}"),
              Image.network("${state["avatar"]}")
            ],
          );
          },
          onLoading: Text("Loading..."),
          onEmpty: Text("Belum ada data"),
          onError: (error) => Text(error.toString())
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.getData();
          }
      ),
    );
  }
}