import 'package:firebasekuldii/app/controllers/auth_controller.dart';
import 'package:firebasekuldii/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
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
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      Get.toNamed(Routes.RESET_PASSWORD);
                    },
                    child: Text("Reset password")
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: (){
                  authC.login(controller.email.text, controller.password.text);
                }, 
                child: Text("LOGIN")
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun ? "),
                  TextButton(
                      onPressed: (){
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Text("Daftar Sekarang")
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
