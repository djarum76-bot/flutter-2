import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Card(
              child: Container(
                height: Get.height * 0.6,
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
                        decoration: InputDecoration(
                            labelText: "Nama",
                            border: OutlineInputBorder()
                        ),
                        controller: controller.name,
                        onSaved: (String? e) => controller.name.text = e!,
                        validator: (val) => val!.isEmpty ? "Nama is Required" : null,
                      ),
                      SizedBox(height: 15,),
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
                      SizedBox(height: 15,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Confirmation Password",
                            border: OutlineInputBorder()
                        ),
                        controller: controller.password_confirmation,
                        onSaved: (String? e) => controller.password_confirmation.text = e!,
                        validator: (val) => val!.isEmpty ? "Password Confirmation is Required" : null,
                      ),
                      SizedBox(height: 20,),
                      TextButton(
                        onPressed: (){
                          controller.check();
                        },
                        child: Text(
                          "Register",
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
                              "Already have an account ? "
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: Text("Login", style: TextStyle(color: Colors.blue),),
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
