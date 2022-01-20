import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waclone/app/routes/app_pages.dart';
import 'package:waclone/app/services/services.dart';

import '../controllers/camera_page_controller.dart';

class CameraPageView extends GetView<CameraPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Stack(
          children: [
            FutureBuilder(
                future: controller.cameraValue,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      width: Get.width,
                      child: CameraPreview(controller.cameraC),
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.only(top: Get.height * 0.00612745098, bottom: Get.height * 0.00612745098),
                width: Get.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: (){
                              controller.flash.toggle();
                              controller.flash.isTrue
                                  ? controller.cameraC.setFlashMode(FlashMode.torch)
                                  : controller.cameraC.setFlashMode(FlashMode.off);
                            },
                            icon: Obx((){
                              return controller.flash.isTrue
                                  ? Icon(
                                      Icons.flash_on,
                                      color: Colors.white,
                                      size: 28,
                                    )
                                  : Icon(
                                      Icons.flash_off,
                                      color: Colors.white,
                                      size: 28,
                                    );
                            })
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.takePhoto(context);
                          },
                          child: Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: (){
                            Get.defaultDialog(
                              title: "Error",
                              middleText: "Fitur belum tersedia"
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Hold for Video, tap for photo",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
