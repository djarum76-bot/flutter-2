import 'package:amaly/app/custom/CustomAppBar.dart';
import 'package:amaly/app/custom/CustomAppBarAlQuran.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/videoislami_controller.dart';

class VideoislamiView extends GetView<VideoislamiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarAlQuran(
                  msg: "Video Islami "
              ),
              Container(
                padding: EdgeInsets.fromLTRB(Get.height * 0.03, Get.height * 0.03, Get.height * 0.03, 0),
                height: Get.height * 0.84,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(bottom: Get.height * 0.03),
                        height: Get.height * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sejarah Islam",
                              style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.w500, color: Color(0xFF000000)),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: Get.height * 0.27,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, index){
                                    return InkWell(
                                      onTap: (){},
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: Get.width * 0.6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width * 0.6,
                                              height: Get.height * 0.18,
                                              decoration: BoxDecoration(
                                                  color: Colors.amber,
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text(
                                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                                              style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF000000)),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                            SizedBox(height: 5,),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "World - 18 Agustus 2021",
                                                style: GoogleFonts.workSans(fontSize: 13,fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            )
                          ],
                        ),
                      );
                    }
                ),
              )
            ],
          )
      ),
    );
  }
}
