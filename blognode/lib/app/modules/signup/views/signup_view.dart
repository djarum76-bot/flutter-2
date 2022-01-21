import 'package:blognode/app/services/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green[200]!],
            begin: FractionalOffset(0.0, 1.0),
            end: FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Form(
          key: globalkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign up with email",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.04901960784, vertical: Get.height * 0.01225490196),
                child: Column(
                  children: [
                    Text("Username"),
                    TextFormField(
                      controller: controller.usernameController,
                      validator: (value) {
                        if (value!.isEmpty) return "Username can't be empty";
                        return null;
                      },
                      onSaved: (String? e) => controller.usernameController.text = e!,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.04901960784, vertical: Get.height * 0.01225490196),
                child: Column(
                  children: [
                    Text("Email"),
                    TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value!.isEmpty) return "Email can't be empty";
                        if (!value.contains("@")) return "Email is Invalid";
                        return null;
                      },
                      onSaved: (String? e) => controller.emailController.text = e!,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.04901960784, vertical: Get.height * 0.01225490196),
                child: Column(
                  children: [
                    Text("Password"),
                    Obx((){
                      return TextFormField(
                        controller: controller.passwordController,
                        validator: (value) {
                          if (value!.isEmpty) return "Password can't be empty";
                          if (value.length < 8) return "Password lenght must have >=8";
                          return null;
                        },
                        onSaved: (String? e) => controller.passwordController.text = e!,
                        obscureText: controller.secure.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(controller.secure.value ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              controller.secure.toggle();
                            },
                          ),
                          helperText: "Password length should have >=8",
                          helperStyle: TextStyle(
                            fontSize: 14,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  controller.check();
                },
                child: Container(
                  width: Get.height * 0.18382352941,
                  height: Get.height * 0.0612745098,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff00A86B),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
