import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_post_controller.dart';

class EditPostView extends GetView<EditPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit a Post'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getPost(Get.arguments),
              builder: (context, snapshot){
                return ListView(
                  children: [
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
                          "Edit Post",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10))
                        ),
                      ),
                    )
                  ],
                );
              }
          )
      ),
    );
  }
}
