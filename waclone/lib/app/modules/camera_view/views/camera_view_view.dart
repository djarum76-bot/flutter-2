import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/camera_view_controller.dart';

class CameraViewView extends GetView<CameraViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: 27,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height - 150,
              child: Image.file(
                File(Get.arguments),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.00612745098, horizontal: Get.height * 0.00980392156),
                child: TextFormField(
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.tealAccent[700],
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 27,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
