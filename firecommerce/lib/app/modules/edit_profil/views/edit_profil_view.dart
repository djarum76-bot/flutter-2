import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Get.height * 0.02),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.04,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          width: Get.height * 0.04901960784,
                          height: Get.height * 0.04901960784,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(LineIcons.arrowLeft, size: 30,),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                          "Edit Profile",
                          style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              FutureBuilder<DocumentSnapshot<Object?>>(
                  future: controller.getDataUser(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      var data = snapshot.data!.data() as Map<String,dynamic>;
                      controller.username.text = data["username"];
                      return Expanded(
                          child: ListView(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    Obx((){
                                      return controller.ambil.value == false
                                          ? data["profile"] == ""
                                              ? CircleAvatar(
                                                  radius: 75,
                                                  backgroundColor: Colors.amber,
                                                )
                                              : CircleAvatar(
                                                  radius: 75,
                                                  backgroundImage: NetworkImage("${data["profile"]}"),
                                                )
                                          : CircleAvatar(
                                              radius: 75,
                                              backgroundImage: FileImage(controller.imageFile.value),
                                            );
                                    }),
                                    Positioned(
                                        right: 0,
                                        bottom: Get.height * 0.01225490196,
                                        child: CircleAvatar(
                                          child: IconButton(
                                              onPressed: (){
                                                controller.ambilGambar();
                                              },
                                              icon: Icon(LineIcons.camera, color: Colors.white,)
                                          ),
                                          backgroundColor: Colors.grey.withOpacity(0.5),
                                        )
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "Username",
                                      style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                                    ),
                                    SizedBox(height: 8,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Username",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          )
                                      ),
                                      controller: controller.username,
                                      style: GoogleFonts.openSans(),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          )
                      );
                    }
                    return Center(child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),);
                  }
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  controller.editUser(controller.username.text);
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
                        "Edit Profile",
                        style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
