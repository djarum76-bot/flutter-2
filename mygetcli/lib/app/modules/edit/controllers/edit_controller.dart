import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  late TextEditingController name;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    name = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    name.dispose();
    super.onClose();
  }
}
