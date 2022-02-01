import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/tambah_alamat_controller.dart';

class TambahAlamatView extends GetView<TambahAlamatController> {
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
                          "Tambah Alamat",
                          style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Provinsi",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                controller: controller.provinsi,
                                style: GoogleFonts.openSans(),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Kabupaten / Kota",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                controller: controller.kabkot,
                                style: GoogleFonts.openSans(),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Kecamatan",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                controller: controller.kec,
                                style: GoogleFonts.openSans(),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Kode Pos",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                controller: controller.kodepos,
                                style: GoogleFonts.openSans(),
                                keyboardType: TextInputType.number,
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Alamat Lengkap",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                controller: controller.detail,
                                style: GoogleFonts.openSans(),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  controller.addAlamat(controller.provinsi.text, controller.kabkot.text, controller.kec.text, controller.kodepos.text, controller.detail.text);
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
