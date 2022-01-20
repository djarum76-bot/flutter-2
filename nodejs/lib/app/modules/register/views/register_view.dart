import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nodejs/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterView'),
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
            SizedBox(height: 6,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Username"
              ),
              controller: controller.username,
              onSaved: (String? e) => controller.username.text = e!,
            ),
            SizedBox(height: 6,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Role"
              ),
              controller: controller.role,
              onSaved: (String? e) => controller.role.text = e!,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  controller.register();
                },
                child: Text("Register")
            )
          ],
        ),
      ),
    );
  }
}
