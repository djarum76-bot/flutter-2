import 'package:blognode/app/routes/app_pages.dart';
import 'package:blognode/app/services/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.04901960784, vertical: Get.height * 0.01225490196),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In with Email",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
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
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text("Password"),
                    Obx((){
                      return TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.secure.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(controller.secure.value ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              controller.secure.toggle();
                            },
                          ),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.FORGOTPASSWORD);
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Text(
                        "New User?",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
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
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
