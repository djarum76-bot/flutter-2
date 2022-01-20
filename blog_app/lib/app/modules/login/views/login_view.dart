import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Card(
              child: Container(
                height: Get.height * 0.4,
                width: Get.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.all(Get.height * 0.03),
                child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder()
                          ),
                          controller: controller.email,
                          onSaved: (String? e) => controller.email.text = e!,
                          validator: (val) => val!.isEmpty ? "Email is Required" : null,
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder()
                          ),
                          controller: controller.password,
                          onSaved: (String? e) => controller.password.text = e!,
                          validator: (val) => val!.isEmpty ? "Password is Required" : null,
                        ),
                        SizedBox(height: 20,),
                        TextButton(
                            onPressed: (){
                              controller.check();
                            },
                            child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                              padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10))
                            ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account ? "
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.REGISTER);
                              },
                              child: Text("Register", style: TextStyle(color: Colors.blue),),
                            )
                          ],
                        )
                      ],
                    ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              elevation: 5,
            ),
          )
      ),
    );
  }
}
