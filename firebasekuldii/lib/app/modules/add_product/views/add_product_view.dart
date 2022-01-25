import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddProductView'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(Get.height * 0.015),
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameC,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "Product Name"
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: controller.priceC,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    labelText: "Price"
                ),
              ),
              SizedBox(height: 10,),
              Obx((){
                return controller.ambil.value == false
                    ? CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.amber,
                      )
                    : CircleAvatar(
                        radius: 40,
                        backgroundImage: FileImage(controller.imageFile.value),
                      );
              }),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    controller.ambilGambar();
                  },
                  child: Text("Ambil Gambar")
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: (){
                    controller.addProduct(controller.nameC.text, controller.priceC.text);
                  },
                  child: Text("Save")
              )
            ],
          ),
      ),
    );
  }
}
