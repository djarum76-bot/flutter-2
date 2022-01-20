import 'package:amaly/app/custom/Tombol.dart';
import 'package:amaly/app/custom/currentcy.dart';
import 'package:amaly/app/routes/app_pages.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../controllers/detailprogramnominal_controller.dart';

class DetailprogramnominalView extends GetView<DetailprogramnominalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(Get.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(
                            "Kekurangan Dana",
                              style: GoogleFonts.openSans(fontSize: 10,fontWeight: FontWeight.w600, color: Color(0xFFCAC3D5))
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.share_outlined, color: Color(0xFF1DAD9B), size: 35,)
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
                    width: Get.width * 0.92,
                    lineHeight: Get.height * 0.015,
                    percent: 15435900 / 20000000,
                    progressColor: Color(0xFF346357),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.03, horizontal: Get.height * 0.2),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 5,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Pilih Nominal Sedekah",
                        style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w600, color: Color(0xFF2D3254))
                    ),
                  ),
                  CustomRadioButton(
                    enableShape: true,
                    shapeRadius: 10,
                    radius: 10,
                    buttonLables: [
                      "Rp 10.000",
                      "Rp 50.000",
                      "Rp 100.000",
                      "Rp 500.000",
                    ],
                    buttonValues: [
                      10000,
                      50000,
                      100000,
                      500000
                    ],
                    radioButtonValue: (value){
                      print(value);
                    },
                    unSelectedColor: Colors.white70.withOpacity(0.5),
                    selectedColor: Color(0xFFFD915A).withOpacity(0.15),
                    horizontal: true,
                    elevation: 0,
                    selectedBorderColor: Color(0xFFFFFD915A),
                    unSelectedBorderColor: Color(0xFFF2F2F2),
                    buttonTextStyle: ButtonTextStyle(
                      selectedColor: Color(0xFF646464),
                      unSelectedColor: Color(0xFF646464),
                      textStyle: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 20)
                    ),
                    height: 50,
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Divider(
                          color: Colors.grey,
                          thickness: 5,
                        ),
                        Text(
                          "Atau",
                            style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400, color: Color(0xFF646464))
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: Get.width * 0.012, right: Get.width * 0.012, bottom: Get.width * 0.1),
                    height: Get.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2)
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        hintText: "Masukkan Nominal Lain",
                        hintStyle: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w300, color: Color(0xFF646464))
                      ),
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        CurrentcyFormat()
                      ],
                      onChanged: (value)=>print(value),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w300, color: Color(0xFF646464))
                    ),
                  ),
                  Tombol(
                      height: Get.height * 0.07,
                      width: Get.width,
                      color: Color(0xFFFF7B02),
                      child: Text(
                        "Lanjut ke Pembayaran",
                          style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))
                      ),
                      onTap: (){
                        Get.toNamed(Routes.METODEPEMBAYARAN);
                      }
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
