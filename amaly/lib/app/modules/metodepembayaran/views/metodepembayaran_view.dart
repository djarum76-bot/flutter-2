import 'package:amaly/app/custom/Tombol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/metodepembayaran_controller.dart';

class MetodepembayaranView extends GetView<MetodepembayaranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Instruksi Sedekah",
                    style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w700, color: Color(0xFF2B2B2B)),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Transfer sesuai nominal dibawah ini : ",
                    style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xFF393D43).withOpacity(0.7)),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rp 50.345",
                        style: GoogleFonts.inter(fontSize: 35,fontWeight: FontWeight.w700, color: Color(0xFF242F41)),
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text(
                            "Salin",
                            style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFFFE9903)),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFE9903).withOpacity(0.1),
                        border: Border.all(
                            color: Color(0xFFFE9903),
                            width: 2
                        )
                    ),
                    child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "PENTING! ",
                                  style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xFF2B2B2B)),
                              ),
                              TextSpan(
                                  text: "Mohon transfer tepat sampai 3 angka terakhir agar sedekah anda lebih mudah diverifikasi",
                                  style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xFF2B2B2B).withOpacity(0.7)),
                              )
                            ]
                        ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                      color: Color(0xFFF5EFFB),
                      height: Get.height * 0.02
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Get.defaultDialog(
                        title: "Fitur belum tersedia",
                        content: Center(
                          child: Lottie.asset("asset/lottie/404.json"),
                        )
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color(0xFFE5E5E5)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pilih Metode Pembayaran",
                            style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500, color: Color(0xFF2B2B2B)),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFC4C4C4).withOpacity(0.4)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04,vertical: Get.width * 0.04),
                          border: InputBorder.none,
                          hintText: "Nama Lengkap"
                      ),
                      style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF000000).withOpacity(0.24)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFC4C4C4).withOpacity(0.4)
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04,vertical: Get.width * 0.04),
                          border: InputBorder.none,
                          hintText: "Nomor Whatsapp"
                      ),
                      style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF000000).withOpacity(0.24)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Donasi sebagai ",
                                  style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF000000).withOpacity(0.24)),
                                ),
                                TextSpan(
                                    text: "Hamba Allah",
                                  style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xFF000000).withOpacity(0.24)),
                                )
                              ]
                          )
                      ),
                      Obx((){
                        return FlutterSwitch(
                            width: 50,
                            height: 25,
                            activeColor: Color(0xFF526EFF),
                            value: controller.isHambaAllah.value,
                            onToggle: (_){
                              controller.isHambaAllah.toggle();
                            }
                        );
                      })
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bersedia menerima laporan via WhatsApp",
                        style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF000000).withOpacity(0.24)),
                      ),
                      Obx((){
                        return FlutterSwitch(
                            width: 50,
                            height: 25,
                            activeColor: Color(0xFF526EFF),
                            value: controller.isHambaAllah.value,
                            onToggle: (_){
                              controller.isHambaAllah.toggle();
                            }
                        );
                      })
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFC4C4C4).withOpacity(0.4)
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04,vertical: Get.width * 0.04),
                          border: InputBorder.none,
                          hintText: "Tulis Do'a Anda disini ..."
                      ),
                      style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF000000).withOpacity(0.24)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Tombol(
                      height:  Get.height * 0.07,
                      width: Get.width,
                      color: Color(0xFFFF7B02),
                      child: Text(
                        "Lanjut ke Pembayaran",
                        style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF)),
                      ),
                      onTap: (){}
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
