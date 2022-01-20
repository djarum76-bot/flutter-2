import 'package:blognode/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController with GetTickerProviderStateMixin{
  late AnimationController controller1;
  late Animation<Offset> animation1;
  late AnimationController controller2;
  late Animation<Offset> animation2;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller1 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    animation1 = Tween<Offset>(
      begin: Offset(0.0, 8.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: controller1, curve: Curves.easeOut),
    );

    controller2 = AnimationController(
      duration: Duration(milliseconds: 2500),
      vsync: this,
    );
    animation2 = Tween<Offset>(
      begin: Offset(0.0, 8.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: controller2, curve: Curves.elasticInOut),
    );

    controller1.forward();
    controller2.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller1.dispose();
    controller2.dispose();
  }

  onEmailClick(){
    Get.toNamed(Routes.SIGNUP);
  }
}
