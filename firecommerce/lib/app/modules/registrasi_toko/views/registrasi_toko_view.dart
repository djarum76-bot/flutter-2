import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/registrasi_toko_controller.dart';

class RegistrasiTokoView extends GetView<RegistrasiTokoController> {
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
                          "Atur Informasi Toko",
                          style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: FutureBuilder<DocumentSnapshot<Object?>>(
                      future: controller.getDataUser(),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          var data = snapshot.data!.data() as Map<String,dynamic>;
                          controller.nama_toko.text = data["username"];
                          return Container(
                            child: ListView(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Nama Toko",
                                        style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                                      ),
                                      SizedBox(height: 8,),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            )
                                        ),
                                        controller: controller.nama_toko,
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
                                        "ALamat Toko",
                                        style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                                      ),
                                      SizedBox(height: 8,),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            )
                                        ),
                                        controller: controller.alamat_toko,
                                        style: GoogleFonts.openSans(),
                                      ),
                                      SizedBox(height: 6,),
                                      Text(
                                          "Contoh : Padang, Sumatera Barat"
                                      ),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Nomor HP",
                                        style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                                      ),
                                      SizedBox(height: 8,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            width: Get.height * 0.07720588235,
                                            height: Get.height * 0.07720588235,
                                            child: Center(
                                              child: Text(
                                                "+62",
                                                style: TextStyle(fontSize: 18)
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                              child: TextFormField(
                                                keyboardType: TextInputType.phone,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10)
                                                    )
                                                ),
                                                controller: controller.no_hp,
                                                style: GoogleFonts.openSans(),
                                              )
                                          )
                                        ],
                                      )
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                  )
              ),
              SizedBox(height: 10,),
              Obx((){
                return controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : InkWell(
                        onTap: (){
                          controller.regisToko(controller.nama_toko.text, controller.alamat_toko.text, controller.no_hp.text);
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
                                "Simpan Informasi",
                                style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
