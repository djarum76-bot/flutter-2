import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  final authC = Get.find<AuthController>();

  final homeColor = true.obs;
  final checkoutColor = false.obs;
  final aboutColor = false.obs;
  final contactUsColor = false.obs;
  final profileColor = false.obs;
}
