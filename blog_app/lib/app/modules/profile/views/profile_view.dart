import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                controller.logout();
              },
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getUserDetail(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  var data = controller.authC.user.value.user;
                  return Container(
                      padding: EdgeInsets.only(top: Get.height * 0.04901960784, left: Get.height * 0.04901960784, right: Get.height * 0.04901960784),
                      child: Center(
                        child: ListView(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Obx((){
                                    return CircleAvatar(
                                      radius: 60,
                                      backgroundImage: data!.image == null
                                          ? controller.gambarA.value == ""
                                            ? AssetImage("asset/placeholder.png") as ImageProvider
                                            : FileImage(controller.imageFile.value)
                                          : NetworkImage(controller.gambarN.value),
                                      backgroundColor: Colors.amber,
                                    );
                                  }),
                                  Positioned(
                                      left: 80,
                                      bottom: 0,
                                      child: InkWell(
                                        onTap: (){
                                          controller.getImage();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "Nama",
                                  border: OutlineInputBorder()
                              ),
                              onSaved: (String? e) => controller.nama.text = e!,
                              validator: (val) => val!.isEmpty ? "Email is Required" : null,
                              initialValue: data!.name,
                            ),
                            SizedBox(height: 20,),
                            TextButton(
                              onPressed: (){
                                controller.editUser();
                              },
                              child: Text(
                                "Update Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                                  padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10))
                              ),
                            )
                          ],
                        ),
                      ),
                  );
                }
              }
          )
      )
    );
  }
}
