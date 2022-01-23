import 'package:firebasekuldii/app/controllers/auth_controller.dart';
import 'package:firebasekuldii/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignupView'),
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
                TextFormField(
                  controller: controller.password,
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                    onPressed: (){
                      authC.signup(controller.email.text, controller.password.text);
                    },
                    child: Text("Sign Up")
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Sudah punya akun ? "),
                    TextButton(
                        onPressed: (){
                          Get.back();
                        },
                        child: Text("Login Sekarang")
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
