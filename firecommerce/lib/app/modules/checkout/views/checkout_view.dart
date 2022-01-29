import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(Get.height * 0.02),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "Checkout",
                                      style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Alamat", style: GoogleFonts.josefinSans(fontWeight: FontWeight.bold, fontSize: 24)),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: Color(0xFFF1F6FB), width: 1),
                                          ),
                                          height: Get.height * 0.09,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: ListTile(
                                              onTap: (){
                                              },
                                              title: Text(
                                                "Pilih Alamat Tujuan",
                                                style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF40484E)),
                                              ),
                                              leading: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Icon(LineIcons.mapMarker),
                                                height: Get.width * 0.1,
                                                width: Get.width * 0.1,
                                              ),
                                              trailing: Icon(Icons.arrow_forward_ios),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Pembayaran", style: GoogleFonts.josefinSans(fontWeight: FontWeight.bold, fontSize: 24)),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: Color(0xFFF1F6FB), width: 1),
                                          ),
                                          height: Get.height * 0.09,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: ListTile(
                                              onTap: (){
                                                Get.defaultDialog(
                                                    title: "Error",
                                                    middleText: "MEtode pembayaran masih belum tersedia"
                                                );
                                              },
                                              title: Text(
                                                "Pilih Metode Pembayaran",
                                                style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF40484E)),
                                              ),
                                              leading: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Icon(LineIcons.mapMarker),
                                                height: Get.width * 0.1,
                                                width: Get.width * 0.1,
                                              ),
                                              trailing: Icon(Icons.arrow_forward_ios),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("My Cart", style: GoogleFonts.josefinSans(fontWeight: FontWeight.bold, fontSize: 24)),
                                        SizedBox(height: 20,),
                                        Container(
                                          width: Get.width,
                                          height: Get.height * 0.24,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 10,
                                              itemBuilder: (context, index){
                                                return index != 9
                                                    ? Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey.withOpacity(0.2),
                                                            borderRadius: BorderRadius.circular(20)
                                                        ),
                                                        margin: EdgeInsets.only(right: Get.height * 0.02),
                                                        height: Get.height,
                                                        width: Get.height * 0.22,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                child: Container()
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft: Radius.circular(20),
                                                                    bottomRight: Radius.circular(20)
                                                                ),
                                                              ),
                                                              margin: EdgeInsets.only(bottom: Get.height * 0.01, left: Get.height * 0.01, right: Get.height * 0.01),
                                                              width: Get.width,
                                                              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015, vertical: Get.height * 0.01),
                                                              height: Get.height * 0.08,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "Nama Produk Barang",
                                                                    style: GoogleFonts.openSans(fontSize: 16),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    softWrap: false,
                                                                  ),
                                                                  Text(
                                                                    "${controller.formatCurrency.format(50000)}",
                                                                    style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    softWrap: false,
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    : Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey.withOpacity(0.2),
                                                            borderRadius: BorderRadius.circular(20)
                                                        ),
                                                        height: Get.height,
                                                        width: Get.height * 0.22,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                child: Container()
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft: Radius.circular(20),
                                                                    bottomRight: Radius.circular(20)
                                                                ),
                                                              ),
                                                              margin: EdgeInsets.only(bottom: Get.height * 0.01, left: Get.height * 0.01, right: Get.height * 0.01),
                                                              width: Get.width,
                                                              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015, vertical: Get.height * 0.01),
                                                              height: Get.height * 0.08,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "Nama Produk Barang",
                                                                    style: GoogleFonts.openSans(fontSize: 16),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    softWrap: false,
                                                                  ),
                                                                  Text(
                                                                    "${controller.formatCurrency.format(50000)}",
                                                                    style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    softWrap: false,
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                              }
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                            height: Get.height * 0.04,
                            margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: GoogleFonts.josefinSans(fontSize: 26),
                                ),
                                Text(
                                  "${controller.formatCurrency.format(50000)}",
                                  style: GoogleFonts.josefinSans(fontSize: 22, color: Colors.deepOrangeAccent),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
                InkWell(
                  onTap: (){
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
                          "Pay Now",
                          style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
