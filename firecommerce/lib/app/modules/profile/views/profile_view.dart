import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(Get.height * 0.02),
            child: Column(
              children: [
                Center(
                  child: Text(
                      "Profile",
                      style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                  ),
                ),
                SizedBox(height: 10,),
                AvatarGlow(
                  child: Container(
                      margin: EdgeInsets.all(15),
                      width: Get.height * 0.21446078431,
                      height: Get.height * 0.21446078431,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepOrangeAccent,
                      )
                  ),
                  endRadius: Get.height * 0.13480392156,
                  glowColor: Colors.black,
                  duration: Duration(seconds: 2),
                ),
                Column(
                  children: [
                    Text(
                      "Nama User",
                      style: GoogleFonts.josefinSans(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      "Coin : 0",
                      style: GoogleFonts.josefinSans(fontSize: 20,),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)
                        ),
                        width: Get.width * 0.25,
                        height: Get.height * 0.2,
                        padding: EdgeInsets.all(Get.height * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: Get.width,
                                height: Get.height * 0.1,
                                child: Icon(LineIcons.edit, size: 70,),
                              ),
                            ),
                            Text(
                                "Edit Profil",
                                style: GoogleFonts.openSans()
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)
                        ),
                        width: Get.width * 0.25,
                        height: Get.height * 0.2,
                        padding: EdgeInsets.all(Get.height * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: Get.width,
                                height: Get.height * 0.1,
                                child: Icon(LineIcons.mapMarked, size: 70,),
                              ),
                            ),
                            Text(
                                "Alamat",
                                style: GoogleFonts.openSans(),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)
                        ),
                        width: Get.width * 0.25,
                        height: Get.height * 0.2,
                        padding: EdgeInsets.all(Get.height * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: Get.width,
                                height: Get.height * 0.1,
                                child: Icon(LineIcons.history, size: 70,),
                              ),
                            ),
                            Text(
                                "Riwayat Pembelian",
                                style: GoogleFonts.openSans(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                    ),
                    width: Get.width,
                    height: Get.height * 0.06,
                    padding: EdgeInsets.all(Get.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(LineIcons.box),
                        SizedBox(width: 8,),
                        Text(
                          "Mau jadi penjual ? ",
                          style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                    ),
                    width: Get.width,
                    height: Get.height * 0.06,
                    padding: EdgeInsets.all(Get.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.red,),
                        SizedBox(width: 8,),
                        Text(
                          "Logout",
                          style: GoogleFonts.openSans(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
