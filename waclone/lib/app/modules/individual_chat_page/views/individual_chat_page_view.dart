import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waclone/app/custom/own_message_card.dart';
import 'package:waclone/app/custom/reply_card.dart';

import '../controllers/individual_chat_page_controller.dart';

class IndividualChatPageView extends GetView<IndividualChatPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
          child: AppBar(
            leadingWidth: Get.height * 0.05514705882,
            leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back, size: 24,),
            ),
            title: InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: SvgPicture.asset(
                      "asset/person.svg",
                      color: Colors.white,
                      height: Get.height * 0.03676470588,
                      width: Get.height * 0.03676470588,
                    ),
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Get.arguments}",
                        style: GoogleFonts.openSans(fontSize: 18.5, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "last seen today at 12:45",
                        style: GoogleFonts.openSans(fontSize: 13),
                      )
                    ],
                  )
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.video_call)),
              IconButton(onPressed: (){}, icon: Icon(Icons.call)),
              PopupMenuButton<String>(
                  itemBuilder: (context){
                    return [
                      PopupMenuItem(child: Text("View Contact"), value: "View Contact",),
                      PopupMenuItem(child: Text("Media, links, and docs"), value: "Media, links, and docs",),
                      PopupMenuItem(child: Text("Whatsapp Web"), value: "Whatsapp Web",),
                      PopupMenuItem(child: Text("Search"), value: "Search",),
                      PopupMenuItem(child: Text("Mute Notification"), value: "Mute Notification",),
                      PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper",),
                    ];
                  }
              )
            ],
          ),
          preferredSize: Size.fromHeight(Get.height * 0.07352941176)
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: Get.height - (Get.height * 0.17156862745),
              child: ListView(
                children: [
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                  OwnMessageCard(message: "Hi Kntl", time: "18.12"),
                  ReplyCard(message: "Apo dang", time: "19.53"),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width - 60,
                    child: Card(
                      margin: EdgeInsets.only(left: Get.height * 0.00245098039, right: Get.height * 0.00245098039, bottom: Get.height * 0.00980392156),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: (){
                                      Get.bottomSheet(
                                        Container(
                                          width: Get.width,
                                          height: Get.height * 0.34068627451,
                                          child: Card(
                                            margin: EdgeInsets.all(Get.height * 0.02205882352),
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01225490196, vertical: Get.height * 0.02450980392),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (){},
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 30,
                                                                child: Icon(Icons.insert_drive_file, size: 29,color: Colors.white,),
                                                                backgroundColor: Colors.indigo,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text("Document", style: GoogleFonts.openSans(fontSize: 12),)
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(width: 40,),
                                                        GestureDetector(
                                                          onTap: (){},
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 30,
                                                                child: Icon(Icons.camera_alt, size: 29,color: Colors.white,),
                                                                backgroundColor: Colors.pink,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text("Camera", style: GoogleFonts.openSans(fontSize: 12),)
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(width: 40,),
                                                        GestureDetector(
                                                          onTap: (){},
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 30,
                                                                child: Icon(Icons.insert_photo, size: 29,color: Colors.white,),
                                                                backgroundColor: Colors.indigo,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text("Gallery", style: GoogleFonts.openSans(fontSize: 12),)
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 30),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (){},
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 30,
                                                                child: Icon(Icons.headset, size: 29,color: Colors.white,),
                                                                backgroundColor: Colors.orange,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text("Audio", style: GoogleFonts.openSans(fontSize: 12),)
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(width: 40,),
                                                        GestureDetector(
                                                          onTap: (){},
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 30,
                                                                child: Icon(Icons.location_pin, size: 29,color: Colors.white,),
                                                                backgroundColor: Colors.teal,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text("Location", style: GoogleFonts.openSans(fontSize: 12),)
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(width: 40,),
                                                        GestureDetector(
                                                          onTap: (){},
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 30,
                                                                child: Icon(Icons.person, size: 29,color: Colors.white,),
                                                                backgroundColor: Colors.blue,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text("Contact", style: GoogleFonts.openSans(fontSize: 12),)
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                            ),
                                          ),
                                        )
                                      );
                                    },
                                    icon: Icon(Icons.attach_file)
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.camera_alt)
                                )
                              ],
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: Get.height * 0.00980392156, horizontal: Get.height * 0.01470588235)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.00980392156, left: Get.height * 0.00245098039),
                    child: CircleAvatar(
                      radius: 25,
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.send)
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
