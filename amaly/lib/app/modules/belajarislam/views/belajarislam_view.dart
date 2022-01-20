import 'package:amaly/app/custom/CustomAppBar.dart';
import 'package:amaly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/belajarislam_controller.dart';

class BelajarislamView extends GetView<BelajarislamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(msg: "Belajar Islam"),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aktivitas Terakhir",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xff346357)),
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(Routes.BELAJARISLAMISI);
                      },
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Panduan Bersuci & Wudhu",
                            style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xff848484)),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Panduan Ibadah Islam",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xff346357)),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: Get.height * 0.45,
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: (){
                                Get.toNamed(Routes.BELAJARISLAMISI);
                              },
                              child: Container(
                                width: Get.width,
                                height: Get.height * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Lorem Ipsum",
                                    style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xff848484)),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
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
