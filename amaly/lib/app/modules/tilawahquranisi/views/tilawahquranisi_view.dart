import 'package:amaly/app/custom/CustomAppBar.dart';
import 'package:amaly/app/custom/CustomAppBarAlQuran.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tilawahquranisi_controller.dart';

class TilawahquranisiView extends GetView<TilawahquranisiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              CustomAppBarAlQuran(msg: "Sedang diputar"),
              Container(
                height: Get.height * 0.35,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red
                ),
              ),
              Text(
                "Nama Qari'",
                style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF333333)),
              ),
              Text(
                "Surat yang diputar'",
                style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF333333)),
              ),
              SizedBox(height: 10,),
              Obx((){
                return Slider(
                    min: 0,
                    max: 200,
                    value: controller.nilaiSlider.value,
                    onChanged: (value){
                      controller.nilaiSlider.value = value;
                    }
                );
              }),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1:12",
                      style: GoogleFonts.workSans(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF333333)),
                    ),
                    Text(
                      "-5:12",
                      style: GoogleFonts.workSans(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF333333)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.replay, size: 30,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.fast_rewind_sharp, size: 30)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_sharp, size: 30)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.fast_forward_sharp, size: 30)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.close_sharp, size: 30)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                child: Divider(
                  color: Colors.grey,
                  height: 20,
                ),
              ),
              Container(
                height: Get.height * 0.216,
                child: ListView.builder(
                    itemCount: 114,
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: index < 9
                            ? Text(
                                  "0${index + 1}",
                                  style: GoogleFonts.workSans(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFF000000)),
                              )
                            : Text(
                                  "${index + 1}",
                                  style: GoogleFonts.workSans(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFF000000)),
                              ),
                        title: Text(
                            "Nama Surat",
                            style: GoogleFonts.workSans(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFF000000)),
                        ),
                        subtitle: Text(
                            "0:00",
                            style: GoogleFonts.workSans(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFFA8A8A8)),
                        ),
                      );
                    }
                ),
              )
            ],
          )
      )
    );
  }
}
