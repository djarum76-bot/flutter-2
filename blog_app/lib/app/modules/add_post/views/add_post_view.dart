import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_post_controller.dart';

class AddPostView extends GetView<AddPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx((){
            return Container(
              width: Get.width,
              height: Get.height * 0.24509803921,
              decoration: BoxDecoration(
                  image: controller.imageFile.value == File("asset/placeholder.png")
                      ? DecorationImage(
                            image: AssetImage("asset/placeholder.png"),
                            fit: BoxFit.cover
                        )
                      : DecorationImage(
                            image: FileImage(controller.imageFile.value),
                            fit: BoxFit.cover
                        )
              ),
              child: Center(
                child: controller.imageFile.value != File("asset/placeholder.png")
                    ? IconButton(
                          onPressed: (){
                            controller.getImage();
                          },
                          icon: Icon(Icons.image, size: 50, color: Colors.black38,)
                      )
                    : GestureDetector(
                        onTap: (){
                          controller.getImage();
                        },
                      )
              ),
            );
          }),
          Form(
              key: controller.formKey,
              child: Padding(
                  padding: EdgeInsets.all(Get.height * 0.00980392156),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 9,
                    decoration: InputDecoration(
                      hintText: "Post Body...",
                      border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black38))
                    ),
                    controller: controller.body,
                    onSaved: (String? e) => controller.body.text = e!,
                    validator: (val) => val!.isEmpty ? "Body is required" : null
                  ),
              )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.00980392156),
              child: TextButton(
                onPressed: (){
                  controller.check();
                },
                child: Text(
                  "Post",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                    padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10))
                ),
              ),
          )
        ],
      )
    );
  }
}
