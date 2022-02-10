import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taskplanner/app/custom/curved.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Container(
                  color: Colors.white,
                  child: CustomPaint(
                    size: Size(
                        Get.width,
                        Get.height
                    ),
                    painter: Curved(),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          margin: EdgeInsets.only(
                            right: 70,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 16, right: 32),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    border: InputBorder.none,
                                    icon: Icon(Icons.account_circle_rounded),
                                    hintText: "Username",
                                  ),
                                  controller: controller.username,
                                  onSaved: (String? e) => controller.username.text = e!,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16, right: 32),
                                child: Obx((){
                                  return TextFormField(
                                    obscureText: controller.obscure.value,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 22),
                                      border: InputBorder.none,
                                      icon: Icon(Icons.account_circle_rounded),
                                      hintText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(controller.obscure.value ? Icons.visibility_off : Icons.visibility),
                                        onPressed: () {
                                          controller.obscure.toggle();
                                        },
                                      )
                                    ),
                                    controller: controller.password,
                                    onSaved: (String? e) => controller.password.text = e!,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green[200]!.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xff1bccba),
                                  Color(0xff22e2ab),
                                ],
                              ),
                            ),
                            child: IconButton(
                                onPressed: (){
                                  controller.login();
                                },
                                icon: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                  size: 32,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(right: 16, top: 16),
                  //       child: Text(
                  //         "Forgot ?",
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.grey[400],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16, top: 24),
                        child: TextButton(
                            onPressed: (){
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: Text(
                              "Register ?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffe98f60),
                              ),
                            )
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
