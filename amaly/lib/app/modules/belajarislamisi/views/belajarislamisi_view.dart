import 'package:amaly/app/custom/CustomAppBar.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/belajarislamisi_controller.dart';

class BelajarislamisiView extends GetView<BelajarislamisiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: Get.height * 0.25,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Judul",
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000)),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: Get.height * 0.41,
                      child: ListView(
                        children: [
                          Text(
                            "Pendahuluan",
                            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
                          ),
                          Text(
                            "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                          ),
                          ExpandChild(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [SizedBox(height: 30,),
                                  Text(
                                    "Isi",
                                    style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
                                  ),
                                  Text(
                                    "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                                    style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                                  ),
                                  SizedBox(height: 30,),
                                  Text(
                                    "Penutup",
                                    style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
                                  ),
                                  Text(
                                    "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                                    style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                                  ),
                                ],
                              )
                          )
                        ],
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
