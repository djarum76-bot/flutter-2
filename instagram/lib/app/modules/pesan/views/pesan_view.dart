import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/pesan_controller.dart';

class PesanView extends GetView<PesanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.06862745098,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(LineIcons.arrowLeft, size: 30,),
                    ),
                    SizedBox(width: 8,),
                    GestureDetector(
                      onTap: (){
                        Get.bottomSheet(
                            Container(
                              height: Get.height * 0.30637254902,
                              decoration: BoxDecoration(
                                  color: Color(0xFF2B2B2B),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.all(Get.height * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10,),
                                  Image.asset("asset/garis.png"),
                                  SizedBox(height: 20,),
                                  Container(
                                    height: Get.height * 0.152,
                                    child: ListView.builder(
                                        itemCount: 2,
                                        itemBuilder: (context, index){
                                          return index == 0
                                              ? ListTile(
                                                  title: Text("User", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),),
                                                  leading: CircleAvatar(radius: 30, backgroundColor: Colors.amber,),
                                                  trailing: Radio(
                                                      value: "User",
                                                      groupValue: controller.user.value,
                                                      onChanged: (String? value){
                                                        print(value);
                                                      }
                                                  ),
                                                )
                                              : Container(
                                                  margin: EdgeInsets.only(top: Get.height * 0.015),
                                                  child: ListTile(
                                                    title: Text("Luffy", style: GoogleFonts.oxygen(color: Colors.white,fontSize: 20),),
                                                    leading: CircleAvatar(radius: 30,backgroundColor: Colors.amber,),
                                                    trailing: Radio(
                                                        value: "Luffy",
                                                        groupValue: controller.user.value,
                                                        onChanged: (String? value){
                                                          print(value);
                                                        }
                                                    ),
                                                  ),
                                                );
                                        }
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: Get.height * 0.015),
                                    child: ListTile(
                                      title: Text("Tambahkan Akun", style: GoogleFonts.oxygen(color: Colors.white,fontSize: 20),),
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 28,
                                          backgroundColor: Color(0xFF2B2B2B),
                                          child: Icon(LineIcons.plus, size: 30,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            enableDrag: true
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "User",
                            style: GoogleFonts.oxygen(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 6,),
                          Icon(LineIcons.angleDown, color: Colors.black, size: 20,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(Get.height * 0.02, Get.height * 0.01, Get.height * 0.02, 0),
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(LineIcons.search, color: Colors.black,),
                            hintText: "Cari",
                            hintStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.black12,
                          ),
                          style: TextStyle(height: 1),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          height: Get.height * 0.814,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index){
                              return Container(
                                margin: index != 9 ? EdgeInsets.only(bottom: Get.height * 0.01) : EdgeInsets.zero,
                                child: ListTile(
                                  onTap: (){},
                                  leading: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.amber,
                                  ),
                                  title: Text(
                                    "Nama",
                                    style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "Dilihat Jumat",
                                    style: GoogleFonts.oxygen()
                                  ),
                                  trailing: Icon(LineIcons.camera, size: 40,),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
