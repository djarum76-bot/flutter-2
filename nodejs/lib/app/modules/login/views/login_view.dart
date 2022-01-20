import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nodejs/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(Get.height * 0.01),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email"
              ),
              controller: controller.email,
              onSaved: (String? e) => controller.email.text = e!,
            ),
            SizedBox(height: 6,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Password"
              ),
              controller: controller.password,
              onSaved: (String? e) => controller.password.text = e!,
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){
                      controller.login();
                    },
                    child: Text("Login")
                ),
                ElevatedButton(
                    onPressed: (){
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text("Register")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
