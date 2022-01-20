import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/ditandai_controller.dart';

class DitandaiView extends GetView<DitandaiController> {
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
                    Text(
                      "Ditandai",
                      style: GoogleFonts.oxygen(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index){
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.amber,
                                          ),
                                          SizedBox(width: 6,),
                                          Row(
                                            children: [
                                              Text(
                                                "User • ",
                                                style: GoogleFonts.oxygen(fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                              GestureDetector(
                                                onTap: (){},
                                                child: index % 2 == 0
                                                    ? Text("Mengikuti", style: GoogleFonts.oxygen(fontSize: 16))
                                                    : Text("Ikuti", style: GoogleFonts.oxygen(fontSize: 16, color: Colors.blue))
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            Get.bottomSheet(
                                                Container(
                                                  height: Get.height * 0.342,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF2B2B2B),
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20)
                                                      )
                                                  ),
                                                  padding: EdgeInsets.all(Get.height * 0.01),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: 10,),
                                                      Image.asset("asset/garis.png"),
                                                      SizedBox(height: 20,),
                                                      Expanded(
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                ListTile(
                                                                  title: Text("Laporkan", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                                ListTile(
                                                                  title: Text("Tandai Opsi", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                                ListTile(
                                                                  title: Text("Salin Tautan", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                                ListTile(
                                                                  title: Text("Bagikan ke...", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                enableDrag: true
                                            );
                                          },
                                          child: Icon(LineIcons.verticalEllipsis)
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: Get.height * 0.3,
                                  color: Colors.blue,
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: (){},
                                                child: Icon(LineIcons.heart, color: Colors.black,),
                                              ),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: (){},
                                                child: Icon(LineIcons.cloud, color: Colors.black,),
                                              ),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: (){},
                                                child: Icon(LineIcons.telegramPlane, color: Colors.black,),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: (){},
                                            child: Icon(LineIcons.bookmark, color: Colors.black,),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8,),
                                      Text(
                                        "560 Suka",
                                        style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      SizedBox(height: 4,),
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "User",
                                                  style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text: " Selamat Pagi",
                                                  style: GoogleFonts.oxygen(fontSize: 16, color: Colors.black,),
                                                )
                                              ]
                                          )
                                      ),
                                      SizedBox(height: 4,),
                                      GestureDetector(
                                        onTap: (){},
                                        child: Material(
                                          child: Text(
                                            "Lihat semua 36 komentar",
                                            style: GoogleFonts.oxygen(fontSize: 16, color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "3 jam yang lalu",
                                        style: GoogleFonts.oxygen(fontSize: 10, color: Colors.grey),
                                      ),
                                      SizedBox(height: 16,),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
