import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waclone/app/modules/camera_page/views/camera_page_view.dart';
import 'package:waclone/app/modules/chats_page/views/chats_page_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp ni boss', style: GoogleFonts.openSans(),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          ),
          PopupMenuButton<String>(
              itemBuilder: (context){
                return [
                  PopupMenuItem(child: Text("New Group"), value: "New Group",),
                  PopupMenuItem(child: Text("New Broadcast"), value: "New Broadcast",),
                  PopupMenuItem(child: Text("Whatsapp Web"), value: "Whatsapp Web",),
                  PopupMenuItem(child: Text("Starred Messages"), value: "Starred Messages",),
                  PopupMenuItem(child: Text("Settings"), value: "Settings",),
                ];
              }
          )
        ],
        bottom: TabBar(
            controller: controller.controller,
            indicatorColor: Colors.white,
            labelStyle: GoogleFonts.openSans(),
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHAT",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALL",
              ),
            ]
        ),
      ),
      body: TabBarView(
          controller: controller.controller,
          children: [
            CameraPageView(),
            ChatsPageView(),
            Container(
              child: Text("3"),
            ),
            Container(
              child: Text("4"),
            ),
          ]
      ),
    );
  }
}
