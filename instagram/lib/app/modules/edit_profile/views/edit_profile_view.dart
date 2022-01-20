import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getUser(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: SpinKitPouringHourGlassRefined(
                        color: Colors.blueAccent
                    ),
                  );
                }else{
                  return Column(
                    children: [
                      Container(
                          height: Get.height * 0.06862745098,
                          width: Get.width,
                          padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child: Icon(Icons.close,size: 30,),
                                  ),
                                  SizedBox(width: 8,),
                                  Text(
                                    "Edit Profil",
                                    style: GoogleFonts.oxygen(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                              GestureDetector(
                                onTap: (){
                                  controller.editProfile();
                                },
                                child: Icon(LineIcons.check, color: Colors.blue,),
                              )
                            ],
                          )
                      ),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015,vertical: Get.height * 0.01),
                            child: ListView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx((){
                                      return CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          radius: 60,
                                          backgroundImage: controller.pp.value == ""
                                              ? controller.selectedImagePath.value == ""
                                              ? AssetImage("asset/placeholder.png") as ImageProvider
                                              : FileImage(File(controller.selectedImagePath.value))
                                              : NetworkImage("${controller.pp.value}")
                                      );
                                    }),
                                    // Obx((){
                                    //   return CircleAvatar(
                                    //       backgroundColor: Colors.amber,
                                    //       radius: 60,
                                    //       backgroundImage: controller.selectedImagePath.value == ""
                                    //           ? AssetImage("asset/placeholder.png") as ImageProvider
                                    //           : FileImage(File(controller.selectedImagePath.value))
                                    //   );
                                    // })
                                    SizedBox(height: 8,),
                                    GestureDetector(
                                      onTap: (){
                                        Get.bottomSheet(
                                            Container(
                                              height: Get.height * 0.23,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF2B2B2B),
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(Get.height * 0.01),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: 10,),
                                                        Image.asset("asset/garis.png"),
                                                        SizedBox(height: 20,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: (){
                                                                controller.getImage(ImageSource.camera);
                                                                Get.back();
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 47,
                                                                    backgroundColor: Colors.white,
                                                                    child: CircleAvatar(
                                                                      radius: 45,
                                                                      child: Icon(LineIcons.camera, size: 40, color: Colors.white,),
                                                                      backgroundColor: Color(0xFF2B2B2B),
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 8,),
                                                                  Text(
                                                                    "Camera",
                                                                    style: GoogleFonts.quicksand(color: Colors.white, fontSize: 24),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: (){
                                                                controller.getImage(ImageSource.gallery);
                                                                Get.back();
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 47,
                                                                    backgroundColor: Colors.white,
                                                                    child: CircleAvatar(
                                                                      radius: 45,
                                                                      child: Icon(LineIcons.photoVideo, size: 40, color: Colors.white,),
                                                                      backgroundColor: Color(0xFF2B2B2B),
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 8,),
                                                                  Text(
                                                                    "Galeri",
                                                                    style: GoogleFonts.quicksand(color: Colors.white, fontSize: 24),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            enableDrag: true
                                        );
                                      },
                                      child: Text(
                                        "Ganti Foto Profil",
                                        style: TextStyle(fontSize: 18, color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black)
                                    ),
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.black),
                                    suffixIcon: Icon(LineIcons.user, color: Colors.black),
                                  ),
                                  controller: controller.username,
                                  onSaved: (String? e) => controller.username.text = e!,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  );
                }
              }
          )
      ),
    );
  }
}
