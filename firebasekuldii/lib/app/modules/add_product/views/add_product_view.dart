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
