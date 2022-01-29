import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/pilih_alamat_controller.dart';

class PilihAlamatView extends GetView<PilihAlamatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Get.height * 0.02),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.04,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          width: Get.height * 0.04901960784,
                          height: Get.height * 0.04901960784,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(LineIcons.arrowLeft, size: 30,),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                          "Alamat",
                          style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: Get.height * 0.025),
                            margin: EdgeInsets.only(bottom: Get.height * 0.01),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio<String>(
                                    value: "alamat",
                                    activeColor: Colors.deepOrangeAccent,
                                    groupValue: controller.alamat.value,
                                    onChanged: (String? value){
                                      Get.back();
                                    }
                                ),
                                Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Judul", style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF40484E)),),
                                          SizedBox(height: 5,),
                                          Text(
                                            "ALamat",
                                            style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF40484E)),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                                Container(
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.07,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                            onTap: (){
                                              Get.toNamed(Routes.EDIT_ALAMAT);
                                            },
                                            child: Icon(LineIcons.edit)
                                        ),
                                        SizedBox(width: 10,),
                                        InkWell(
                                            onTap: (){
                                            },
                                            child: Icon(Icons.delete)
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                    ),
                  )
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.TAMBAH_ALAMAT);
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrangeAccent
                    ),
                    width: Get.width,
                    height: Get.height * 0.075,
                    child: Center(
                      child: Text(
                        "Tambah Alamat",
                        style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
