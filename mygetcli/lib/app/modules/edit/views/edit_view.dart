import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mygetcli/app/modules/add/controllers/add_controller.dart';
import 'package:mygetcli/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  final homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final data = homeC.findById(Get.arguments);
    controller.name.text = data.name!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
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
                homeC.edit(Get.arguments, controller.name.text);
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  homeC.edit(Get.arguments, controller.name.text);
                },
                child: Text("Edit Product")
            )
          ],
        ),
      ),
    );
  }
}
