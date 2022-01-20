import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    controller.dispose();
  }
}
