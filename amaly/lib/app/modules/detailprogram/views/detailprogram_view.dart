import 'package:amaly/app/custom/CustomAppBar.dart';
import 'package:amaly/app/custom/Tombol.dart';
import 'package:amaly/app/routes/app_pages.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/detailprogram_controller.dart';

class DetailprogramView extends GetView<DetailprogramController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(msg: "Detail Program"),
              Container(
                padding: EdgeInsets.all(20),
                height: Get.height * 0.8405,
                child: ListView(
                  children: [
                    Container(
                      height: Get.height * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lorem Ipsum",
                                style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF29282C))
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Kekurangan Dana",
                                style: GoogleFonts.openSans(fontSize: 10,fontWeight: FontWeight.w600, color: Color(0xFFCAC3D5))
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: (){}, 
                            icon: Icon(Icons.share_outlined, color: Color(0xFF1DAD9B),size: 35,)
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp 15.435.900",
                            style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF346357))
                        ),
                        Text(
                          "3 hari lagi",
                            style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF4F4F4F))
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    LinearPercentIndicator(
                      width: Get.width * 0.9,
                      lineHeight: Get.height * 0.015,
                      percent: 15435900 / 20000000,
                      progressColor: Color(0xFF346357),
                    ),
                    Obx((){
                      return controller.isFull.isTrue
                          ? SizedBox(height: 0,)
                          : Column(
                              children: [
                                SizedBox(height: 20),
                                Tombol(
                                    onTap: (){
                                      Get.toNamed(Routes.DETAILPROGRAMNOMINAL);
                                    },
                                    height: Get.height * 0.07,
                                    color: Color(0xFFFF7B02),
                                    width: Get.width,
                                    child: Text(
                                      "Bersedekah Sekarang",
                                        style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))
                                    )
                                ),
                              ],
                            );
                    }),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Penjelasan Program",
                            style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xFF333333))
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam suscipit risus pulvinar, hendrerit nisi quis, vehicula ante. Morbi ut diam elit. Praesent non justo sodales, auctor lacus id, congue massa. Duis ac odio dui. Sed sed egestas metus. Donec hendrerit velit magna. Vivamus elementum, nulla ac tempor euismod, erat nunc mollis diam, nec consequat nisl ex eu tellus. Curabitur fringilla enim at lorem pulvinar, id ornare tellus aliquam. Cras eget nibh tempor lacus aliquam rutrum.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xFF828282)),
                        ),
                        Obx((){
                          return controller.isFull.isTrue
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    Container(
                                        color: Color(0xFFF5EFFB),
                                        height: Get.height * 0.02
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                        "Kabar Terbaru",
                                      style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xFF333333)),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Lottie.asset("asset/lottie/nopage.json"),
                                    ),
                                    SizedBox(height: 10,),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          "Belum ada kabar terbaru penggalangan dana ini",
                                          style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xFF828282)),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                        color: Color(0xFFF5EFFB),
                                        height: Get.height * 0.02
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                        "Do'a Do'a Para Donatur",
                                        style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xFF333333)),
                                    ),
                                    SizedBox(height: 30,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Nama Donatur",
                                                  style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xFF333333)),
                                              ),
                                              Text(
                                                  "3 hari yang lalu",
                                                  style: GoogleFonts.openSans(fontSize: 10,fontWeight: FontWeight.w400, color: Color(0xFFBDBDBD)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.   ac tempor euismod, erat nunc mollis diam, nec consequat nisl ex eu tellus. Curabitur fringilla enim at lorem pulvinar, id ornare tellus aliquam. Cras eget nibh tempor lacus aliquam rutrum.',
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xFF828282)),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  onPressed: (){},
                                                  icon: Icon(Icons.favorite_border, color: Color(0xFF346357),)
                                              ),
                                              Text(
                                                  "Aminkan Do'a ini",
                                                  style: GoogleFonts.openSans(fontSize: 10,fontWeight: FontWeight.w600, color: Color(0xFF346357)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Nama Donatur",
                                                  style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xFF333333)),
                                              ),
                                              Text(
                                                  "3 hari yang lalu",
                                                  style: GoogleFonts.openSans(fontSize: 10,fontWeight: FontWeight.w400, color: Color(0xFFBDBDBD)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.   ac tempor euismod, erat nunc mollis diam, nec consequat nisl ex eu tellus. Curabitur fringilla enim at lorem pulvinar, id ornare tellus aliquam. Cras eget nibh tempor lacus aliquam rutrum.',
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xFF828282)),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                  onPressed: (){},
                                                  icon: Icon(Icons.favorite_border, color: Color(0xFFEB5757),)
                                              ),
                                              Text(
                                                  "5 Orang telah mengaminkan",
                                                  style: GoogleFonts.openSans(fontSize: 10,fontWeight: FontWeight.w600, color: Color(0xFFEB5757)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 50,),
                                    Row(
                                      children: [
                                        Tombol(
                                            onTap: (){},
                                            height: Get.height * 0.07,
                                            color: Colors.white,
                                            width: Get.width * 0.35,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.share_outlined, color: Color(0xFF346357),),
                                                Text(
                                                  "Bagikan",
                                                  style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF346357)),
                                                )
                                              ],
                                            )
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: Tombol(
                                              onTap: (){
                                                Get.toNamed(Routes.DETAILPROGRAMNOMINAL);
                                              },
                                              height: Get.height * 0.07,
                                              color: Color(0xFFFF7B02),
                                              child: Text(
                                                "Bersedekah Sekarang",
                                                  style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                  ],
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                      onPressed: (){
                                        controller.isFull.value = true;
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down_sharp)
                                  ),
                                );
                        }),
                      ],
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