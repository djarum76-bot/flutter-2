import 'package:bane/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.03, horizontal: Get.height * 0.025),
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView(
                children: [
                  Lottie.asset("asset/login.json"),
                  SizedBox(height: 30,),
                  Form(
                      key: controller.key,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Username",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            controller: controller.username,
                            style: GoogleFonts.openSans(),
                            validator: (a){
                              if(a!.isEmpty){
                                return "Password tidak boleh kosong";
                              }
                            },
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            controller: controller.email,
                            style: GoogleFonts.openSans(),
                            validator: (a){
                              if(a!.isEmpty){
                                return "Email tidak boleh kosong";
                              }
                              else if(!(a.contains("@"))){
                                return "Email tidak valid";
                              }
                            },
                          ),
                          SizedBox(height: 15,),
                          Obx((){
                            return TextFormField(
                              obscureText: controller.secure.value,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(controller.secure.value ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      controller.secure.toggle();
                                    },
                                  )
                              ),
                              controller: controller.password,
                              style: GoogleFonts.openSans(),
                              validator: (a){
                                if(a!.isEmpty){
                                  return "Password tidak boleh kosong";
                                }else if(a.length < 8){
                                  return "Password memiliki panjang minimal 8 karakter";
                                }
                              },
                            );
                          })
                        ],
                      )
                  ),
                  SizedBox(height: 30,),
                  Obx((){
                    return controller.loading.value
                        ? Center(
                            child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
                          )
                        : InkWell(
                            onTap: (){
                              controller.check();
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.deepOrangeAccent
                                ),
                                width: Get.width,
                                height: Get.height * 0.075,
                                child: Center(
                                  child: Text(
                                    "Register",
                                    style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                          );
                  }),
                  SizedBox(height: 20,),
                  Divider(color: Colors.black,),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "A member ? "
                      ),
                      TextButton(
                          onPressed: (){
                            Get.back();
                          },
                          child: Text("Login now")
                      )
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
