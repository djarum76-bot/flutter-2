import 'package:bane/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                    SizedBox(height: 20,),
                    Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                              validator: (a){
                                if(a!.isEmpty){
                                  return "Email tidak boleh kosong";
                                }
                                else if(!(a.contains("@"))){
                                  return "Email tidak valid";
                                }
                              },
                              controller: controller.email,
                              style: GoogleFonts.openSans(),
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
                                    ),
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
                            }),
                          ],
                        )
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: (){
                            controller.authC.resetPassword(controller.email.text);
                          },
                          child: TextButton(
                              onPressed: (){},
                              child: Text(
                                "Reset Password",
                                style: GoogleFonts.openSans(),
                              )
                          )
                      ),
                    ),
                    Obx((){
                      return controller.loading.value
                          ? Center(
                              child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
                            )
                          : InkWell(
                              onTap: ()async{
                                controller.loadingG.value = true;
                                await controller.check();
                                controller.loadingG.value = false;
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
                                      "Login",
                                      style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    }),
                    SizedBox(height: 20,),
                    Divider(color: Colors.black,),
                    SizedBox(height: 20,),
                    Obx((){
                      return controller.loadingG.value
                          ? Center(
                              child: CircularProgressIndicator(color:  Colors.deepOrangeAccent,),
                            )
                          : InkWell(
                              onTap: ()async{
                                controller.loadingG.value = true;
                                await controller.authC.loginGoogle();
                                controller.loadingG.value = false;
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                elevation: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white
                                  ),
                                  width: Get.width,
                                  height: Get.height * 0.075,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("asset/google.png"),
                                      Text(
                                        "Google",
                                        style: GoogleFonts.openSans(fontSize: 22),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                    }),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member ? "
                        ),
                        TextButton(
                            onPressed: (){
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: Text("Register now")
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
