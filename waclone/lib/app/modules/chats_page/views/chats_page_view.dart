import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waclone/app/routes/app_pages.dart';

import '../controllers/chats_page_controller.dart';

class ChatsPageView extends GetView<ChatsPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index){
            var data = controller.chats[index];
            return ListTile(
              onTap: (){
                Get.toNamed(Routes.INDIVIDUAL_CHAT_PAGE, arguments: data.name);
              },
              leading: CircleAvatar(
                radius: 30,
                child: SvgPicture.asset(
                    "${data.icon}",
                    color: Colors.white,
                    height: Get.height * 0.04534313725,
                    width: Get.height * 0.04534313725,
                ),
              ),
              title: Text("${data.name}", style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),),
              subtitle: Row(
                children: [
                  Icon(Icons.done_all),
                  SizedBox(width: 4,),
                  Text("${data.currentMessage}", style: GoogleFonts.openSans(fontSize: 13))
                ],
              ),
              trailing: Text("${data.time}", style: GoogleFonts.openSans()),
            );
          },
          itemCount: controller.chats.length,
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.only(right: Get.height * 0.02450980392, left: Get.height * 0.09803921568),
                child: Divider(thickness: 1,),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(Routes.SELECT_CONTACT);
          },
          child: Icon(Icons.chat),
      ),
    );
  }
}
