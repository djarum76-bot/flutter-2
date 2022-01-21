import 'dart:io';

import 'package:blognode/app/services/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/create_profile_controller.dart';

class CreateProfileView extends GetView<CreateProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: globalkey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02450980392, vertical: Get.height * 0.03676470588),
              children: <Widget>[
                Center(
                  child: Stack(children: <Widget>[
                    Obx((){
                      return CircleAvatar(
                        radius: 80.0,
                        backgroundImage: controller.pp.value == ""
                            ? AssetImage("asset/placeholder.png") as ImageProvider
                            : FileImage(File(controller.file.value.path)),
                      );
                    }),
                    Positioned(
                      bottom: 20.0,
                      right: 20.0,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder){
                              return Container(
                                height: Get.height * 0.1225490196,
                                width: Get.width,
                                margin: EdgeInsets.symmetric(
                                  horizontal: Get.height * 0.02450980392,
                                  vertical: Get.height * 0.02450980392,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Choose Profile photo",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlatButton.icon(
                                            icon: Icon(Icons.camera),
                                            onPressed: () {
                                              Get.back();
                                              controller.getImage(ImageSource.camera);
                                            },
                                            label: Text("Camera"),
                                          ),
                                          FlatButton.icon(
                                            icon: Icon(Icons.image),
                                            onPressed: () {
                                              Get.back();
                                              controller.getImage(ImageSource.gallery);
                                            },
                                            label: Text("Gallery"),
                                          )
                                        ]
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.teal,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.name,
                  validator: (value) {
                    if (value!.isEmpty) return "Name can't be empty";

                    return null;
                  },
                  onSaved: (String? e) => controller.name.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        )),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    labelText: "Name",
                    helperText: "Name can't be empty",
                    hintText: "Dev Stack",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.profession,
                  validator: (value) {
                    if (value!.isEmpty) return "Profession can't be empty";

                    return null;
                  },
                  onSaved: (String? e) => controller.profession.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        )),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    labelText: "Profession",
                    helperText: "Profession can't be empty",
                    hintText: "Full Stack Developer",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.dob,
                  validator: (value) {
                    if (value!.isEmpty) return "DOB can't be empty";

                    return null;
                  },
                  onSaved: (String? e) => controller.dob.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        )),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    labelText: "Date Of Birth",
                    helperText: "Provide DOB on dd/mm/yyyy",
                    hintText: "01/01/2020",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.title,
                  validator: (value) {
                    if (value!.isEmpty) return "Title can't be empty";

                    return null;
                  },
                  onSaved: (String? e) => controller.title.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        )),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    labelText: "Title",
                    helperText: "It can't be empty",
                    hintText: "Flutter Developer",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.about,
                  validator: (value) {
                    if (value!.isEmpty) return "About can't be empty";

                    return null;
                  },
                  onSaved: (String? e) => controller.about.text = e!,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        )),
                    labelText: "About",
                    helperText: "Write about yourself",
                    hintText: "I am Dev Stack",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    controller.check();
                  },
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
