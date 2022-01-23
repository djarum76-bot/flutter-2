import 'package:firecommerce/app/services/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  final homeColor = true.obs;
  final checkoutColor = false.obs;
  final aboutColor = false.obs;
  final contactUsColor = false.obs;
  final profileColor = false.obs;
  final authC = Get.find<AuthController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(authC.box.read('isLogin') == null){
      authC.box.write('isLogin', true);
    }
  }
}
