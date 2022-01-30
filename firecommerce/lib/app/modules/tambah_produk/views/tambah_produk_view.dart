import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/tambah_produk_controller.dart';

class TambahProdukView extends GetView<TambahProdukController> {
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
                          "Tambah Produk",
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
                                "Nama Produk",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                controller: controller.nama_produk,
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
                                "Harga",
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
                                          "Rp",
                                          style: TextStyle(fontSize: 18)
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            )
                                        ),
                                        controller: controller.harga,
                                        style: GoogleFonts.openSans(),
                                      )
                                  )
                                ],
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
                                "Stok",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                controller: controller.stok,
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
                                "Gambar",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              InkWell(
                                onTap: (){
                                  controller.ambilGambar();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  width: Get.width,
                                  height: Get.height * 0.25,
                                  child: Obx((){
                                    return controller.ambil.value == false
                                        ? Center(
                                            child: Icon(LineIcons.camera, size: 75,),
                                          )
                                        : Image.file(
                                            controller.imageFile.value,
                                            fit: BoxFit.cover,
                                          );
                                  }),
                                ),
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
                                "Kategori",
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(height: 8,),
                              DropdownButtonFormField2(
                                  items: controller.categories.map((kategori){
                                    return DropdownMenuItem<String>(
                                        value: kategori,
                                        child: Text(
                                          kategori,
                                          style: TextStyle(fontSize: 16),
                                        )
                                    );
                                  }).toList(),
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  hint: Text(
                                    'Pilih Kategori',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 60,
                                  buttonPadding: EdgeInsets.only(left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onChanged: (value) {
                                    controller.kategori.value = value.toString().toLowerCase();
                                  },
                                  onSaved: (value) {
                                    controller.kategori.value = value.toString().toLowerCase();
                                  },
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
                                "Deskripsi Produk",
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
                                controller: controller.deskripsi_produk,
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
                  controller.addProduct();
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
                        "Tambah Produk",
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
