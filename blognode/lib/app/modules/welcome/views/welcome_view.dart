import 'package:blognode/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.green[200]!
                  ],
                  begin: FractionalOffset(0.0, 1.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0,1.0],
                  tileMode: TileMode.repeated
              )
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.04901960784, horizontal: Get.height * 0.04901960784),
                child: Column(
                  children: [
                    SlideTransition(
                      position: controller.animation1,
                      child: Text(
                        "Ini App",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height / 6,),
                    SlideTransition(
                      position: controller.animation1,
                      child: Text(
                        "You'll Never Walk Alone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    boxContainer("asset/google.png", "Sign up with Google", (){}),
                    SizedBox(height: 20,),
                    boxContainer("asset/facebook.png", "Sign up with Facebook", (){}),
                    SizedBox(height: 20,),
                    boxContainer(
                      "asset/email.png",
                      "Sign up with Email",
                      (){
                        controller.onEmailClick();
                      },
                    ),
                    SizedBox(height: 20,),
                    SlideTransition(
                        position: controller.animation2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.SIGNIN);
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                    )
                  ],
                ),
            ),
          )
      ),
    );
  }

  Widget boxContainer(String path,String text, Function() onTap){
    return SlideTransition(
        position: controller.animation2,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: Get.height * 0.07352941176,
            width: Get.width - (Get.height * 0.17156862745),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02450980392, vertical: Get.height * 0.01225490196),
                child: Row(
                  children: [
                    Image.asset(
                      path,
                      height: Get.height * 0.0306372549,
                      width: Get.height * 0.0306372549,
                    ),
                    SizedBox(width: 20),
                    Text(
                      text,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
