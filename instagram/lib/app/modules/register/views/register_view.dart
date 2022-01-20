import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/bg.png"),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
            child: Center(
              child: ClipPath(
                clipper: WaveClipperTwo(flip: true,reverse: true),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  elevation: 5,
                  child: Container(
                    height: Get.height * 0.75,
                    width: Get.height * 0.4,
                    child: ListView(
                      children: [
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: TextLiquidFill(
                              text: "Gabut",
                              waveColor: Colors.black,
                              boxBackgroundColor: Colors.white,
                              boxHeight: Get.height * 0.2,
                              boxWidth: Get.height * 0.15,
                              textStyle: GoogleFonts.pacifico(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: Get.height * 0.02, right: Get.height * 0.02, bottom: Get.height * 0.02),
                            child: Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(),
                                            hintText: "Username",
                                            suffixIcon: Icon(LineIcons.user)
                                        ),
                                        controller: controller.username,
                                        onSaved: (String? e) => controller.username.text = e!,
                                        validator: (val) => val!.isEmpty ? "Username harus diisi" : null
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(),
                                            hintText: "E-Mail",
                                            suffixIcon: Icon(LineIcons.envelope)
                                        ),
                                        controller: controller.email,
                                        onSaved: (String? e) => controller.email.text = e!,
                                        validator: (val) => val!.isEmpty ? "E-Mail harus diisi" : null
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText: "Password",
                                          suffixIcon: Icon(LineIcons.key)
                                      ),
                                      obscureText: true,
                                      controller: controller.password,
                                      onSaved: (String? e) => controller.password.text = e!,
                                      validator: (val) => val!.isEmpty ? "Password harus diisi" : null,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText: "Konfirmasi Password",
                                          suffixIcon: Icon(LineIcons.key)
                                      ),
                                      obscureText: true,
                                      controller: controller.password_confirmation,
                                      onSaved: (String? e) => controller.password_confirmation.text = e!,
                                      validator: (val) => val!.isEmpty ? "Password harus sama" : null,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Obx((){
                                        return controller.loading.value
                                            ? SpinKitPouringHourGlassRefined(
                                                  color: Colors.blueAccent
                                              )
                                            : ElevatedButton(
                                          onPressed: (){
                                            controller.check();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("SIGN UP"),
                                              SizedBox(width: 8,),
                                              Icon(LineIcons.arrowRight)
                                            ],
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Already have an account ? "),
                                        GestureDetector(
                                          onTap: (){
                                            Get.offAllNamed(Routes.LOGIN);
                                          },
                                          child: Text(
                                            "Sign In",
                                            style: GoogleFonts.lato(color: Colors.blueAccent),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
