import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/add_story_controller.dart';

class AddStoryView extends GetView<AddStoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              Container(
                  height: Get.height * 0.06862745098,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Buat Story",
                        style: GoogleFonts.oxygen(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.createStory();
                        },
                        child: Icon(LineIcons.check, color: Colors.blue,),
                      )
                    ],
                  )
              ),
              Expanded(
                  child: GestureDetector(
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
                      child: Obx((){
                        return controller.selectedImagePath.value == ""
                            ? Icon(LineIcons.camera, size: 60,)
                            : Image.file(File(controller.selectedImagePath.value), fit: BoxFit.cover,);
                      })
                  )
              )
            ],
          )
      ),
    );
  }
}
