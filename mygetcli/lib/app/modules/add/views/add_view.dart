import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mygetcli/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                autocorrect: false,
                controller: controller.name,
                decoration: InputDecoration(
                    labelText: "Nama Barang",
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nama Barang"
                ),
                onEditingComplete: (){
                  Get.find<HomeController>().add(controller.name.text);
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Get.find<HomeController>().add(controller.name.text);
                  },
                  child: Text("Add Product")
              )
            ],
          ),
      ),
    );
  }
}
