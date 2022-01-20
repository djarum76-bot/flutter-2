import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  late TextEditingController statusC;

  @override
  void onInit() {
    // TODO: implement onInit
    statusC = new TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    statusC.dispose();
    super.onClose();
  }
}
