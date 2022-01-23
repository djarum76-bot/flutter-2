import 'package:firebasekuldii/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResetPasswordView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Get.height * 0.015),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                    onPressed: (){
                      authC.resetPassword(controller.email.text);
                    },
                    child: Text("Reset")
                ),
              ],
            ),
          )
      ),
    );
  }
}
