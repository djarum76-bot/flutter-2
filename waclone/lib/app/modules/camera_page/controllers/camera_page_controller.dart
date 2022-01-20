import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:waclone/app/routes/app_pages.dart';
import 'package:waclone/app/services/services.dart';

class CameraPageController extends GetxController {
  late CameraController cameraC;

  late Future<void> cameraValue;

  final flash = false.obs;

  final isCameraFront = false.obs;
  final transform = 0.0.obs;
  final cameraPos = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cameraC = CameraController(cameras![0],ResolutionPreset.high);
    cameraValue = cameraC.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraC.dispose();
  }

  void takePhoto(BuildContext context) async {
    XFile file = await cameraC.takePicture();
    Get.toNamed(Routes.CAMERA_VIEW, arguments: file.path);
  }
}
