import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

import '../controllers/detail_note_controller.dart';

class DetailNoteView extends GetView<DetailNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EEDC),
      body: SafeArea(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.18,
                decoration: BoxDecoration(
                    color: Color(0xffFABB51),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                ),
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.03, horizontal: Get.height * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new, size: 30,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title",
                          style: GoogleFonts.righteous(fontSize: 30),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(Get.height * 0.015),
                    child: ListView(
                      children: [
                        Text(
                          "Content",
                          style: GoogleFonts.righteous(fontSize: 30),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: GoogleFonts.openSans(fontSize: 20),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01, horizontal: Get.height * 0.015),
                width: Get.width,
                height: Get.height * 0.07,
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Get.back();
                          },
                          child: Text(
                            "Delete Note",
                            style: GoogleFonts.righteous(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFC4F4F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        )
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Get.toNamed(Routes.EDIT_NOTE);
                          },
                          child: Text(
                            "Edit Note",
                            style: GoogleFonts.righteous(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF219F94),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
