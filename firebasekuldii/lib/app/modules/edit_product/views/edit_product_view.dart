import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProductView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              var data = snapshot.data!.data() as Map<String,dynamic>;
              controller.nameC.text = data["name"];
              controller.priceC.text = data["price"];
              controller.imageFile.value = data["gambar"];
              return Padding(
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
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: FileImage(controller.imageFile.value),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                        onPressed: (){
                          controller.editProduct(controller.nameC.text, controller.priceC.text, Get.arguments);
                        },
                        child: Text("Edit")
                    )
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator(),);
          }
      ),
    );
  }
}
