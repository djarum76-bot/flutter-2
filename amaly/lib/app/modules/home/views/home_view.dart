import 'package:amaly/app/custom/BekalAkhiratItem.dart';
import 'package:amaly/app/custom/TabunganAkhiratItem.dart';
import 'package:amaly/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            title: Text(
              "Amaly",
              style: GoogleFonts.workSans(fontSize: 25, fontWeight: FontWeight.w600, color: Color(0xff346357)),
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.menu, color: Colors.black,)
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ), 
          preferredSize: Size.fromHeight(60)
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height * 0.25,
                        child: PageView.builder(
                          itemCount: 3,
                          itemBuilder: (context, position){
                            Color color;
                            if (position % 3 == 0) {
                              color = Colors.red;
                            } else if (position % 3 == 1) {
                              color = Colors.blue;
                            } else {
                              color = Colors.green;
                            }

                            return Container(
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bekal Akhirat",
                            style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff346357)),
                          ),
                          TextButton(
                              onPressed: (){},
                              child: Text(
                                "Lihat Semua",
                                style: GoogleFonts.openSans(fontSize: 14, color: Color(0xff1DAD9B), decoration: TextDecoration.underline, fontWeight: FontWeight.w400),
                              )
                          )
                        ],
                      ),
                      Container(
                          width: Get.width,
                          height: Get.height * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BekalAkhiratItem(
                                  msg: "Baca Qur'an",
                                  onTap: (){
                                    Get.toNamed(Routes.DAFTARSURAT);
                                  },
                                  gambar: "asset/icon/quran.png",
                              ),
                              BekalAkhiratItem(
                                  msg: "Belajar Islam",
                                  onTap: (){
                                    Get.toNamed(Routes.BELAJARISLAM);
                                  },
                                  gambar: "asset/icon/ramadan.png",
                              ),
                              BekalAkhiratItem(
                                  msg: "Murattal Qur'an",
                                  onTap: (){
                                    Get.toNamed(Routes.TILAWAHQURAN);
                                  },
                                  gambar: "asset/icon/headset.png",
                              ),
                              BekalAkhiratItem(
                                  msg: "Tanya Ustad",
                                  onTap: (){
                                    Get.toNamed(Routes.TANYAUSTADZ);
                                  },
                                  gambar: "asset/icon/question.png",
                              ),
                            ],
                          )
                      ),
                      Container(
                        height: Get.height * 0.2,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index){
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              );
                            }
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tilawah Qur'an",
                            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF346357)),
                          ),
                          TextButton(
                              onPressed: (){
                                Get.toNamed(Routes.TILAWAHQURAN);
                              },
                              child: Text(
                                "Lihat Semua",
                                style: GoogleFonts.inter(fontSize: 14, color: Color(0xff1DAD9B), decoration: TextDecoration.underline, fontWeight: FontWeight.w400),
                              )
                          )
                        ],
                      ),
                      Container(
                        height: Get.height * 0.3,
                        margin: EdgeInsets.only(top: 5,bottom: 20),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index){
                              return InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.TILAWAHQURANISI);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: Get.width * 0.55,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: Get.height * 0.2,),
                                      Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                            width: Get.width * 0.6,
                                            child: Text(
                                              "Lorem Ipsum asdashdaoufha",
                                              style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFFFFFFFF)),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF000000).withOpacity(0.4),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(20,),
                                                    bottomRight: Radius.circular(20,)
                                                )
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Berita Yayasan",
                            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff346357)),
                          ),
                          TextButton(
                              onPressed: (){},
                              child: Text(
                                "Lihat Semua",
                                style: GoogleFonts.inter(fontSize: 14, color: Color(0xff1DAD9B), decoration: TextDecoration.underline, fontWeight: FontWeight.w400),
                              )
                          )
                        ],
                      ),
                      Container(
                        height: Get.height * 0.4,
                        margin: EdgeInsets.only(top: 5),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index){
                              return InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.DETAILBERITA);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: Get.width * 0.6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: Get.width * 0.6,
                                        height: Get.height * 0.225,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Expanded(
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "World - 18 Agustus 2021",
                                                  style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey),
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text(
                                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                                                style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                              )
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tabungan Akhirat",
                          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff346357)),
                        ),
                      ),
                      Container(
                          width: Get.width,
                          height: Get.height * 0.2,
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TabunganAkhiratItem(
                                msg: "Zakat",
                                gambar: "asset/icon/zakat.png",
                              ),
                              TabunganAkhiratItem(
                                msg: "Infaq Sedekah",
                                gambar: "asset/icon/infaq.png",
                              ),
                              TabunganAkhiratItem(
                                msg: "Wakaf",
                                gambar: "asset/icon/growth.png",
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Program Prioritas",
                            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff346357)),
                          ),
                          TextButton(
                              onPressed: (){},
                              child: Text(
                                "Lihat Semua",
                                style: GoogleFonts.inter(fontSize: 14, color: Color(0xff1DAD9B), decoration: TextDecoration.underline, fontWeight: FontWeight.w400),
                              )
                          )
                        ],
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.5,
                        margin: EdgeInsets.only(top: 5),
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index){
                              return InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.DETAILPROGRAM);
                                },
                                child: Container(
                                  width: Get.width,
                                  height: Get.height * 0.45,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: Get.width,
                                        height: Get.height * 0.32,
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Expanded(
                                          child: Column(
                                            children: [
                                              Align(
                                                child: Text(
                                                  "Lorem Ipsum",
                                                  style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF29282C)),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                              SizedBox(height: 10),
                                              Align(
                                                child: Text(
                                                  "Kekurangan Dana",
                                                  style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 10, color: Color(0xFFCAC3D5)),
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Rp 15.435.900",
                                                    style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff346357)),
                                                  ),
                                                  Text(
                                                    "3 hari lagi",
                                                    style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff4F4F4F)),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              LinearPercentIndicator(
                                                width: Get.width * 0.9,
                                                lineHeight: Get.height * 0.015,
                                                percent: 15435900 / 20000000,
                                                progressColor: Color(0xFF346357),
                                              )
                                            ],
                                          )
                                      )
                                    ],
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
            ),
          )
      ),
    );
  }
}