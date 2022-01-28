import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
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
                                      "My Cart",
                                      style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return Container(
                                        margin: EdgeInsets.only(bottom: Get.height * 0.02),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        width: Get.width,
                                        height: Get.height * 0.2,
                                        padding: EdgeInsets.all(Get.height * 0.02),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.yellow,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              width: Get.height * 0.1225490196,
                                              height: Get.height,
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              width: Get.height * 0.18382352941,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Apple Watch Series 6",
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    softWrap: false,
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    "${controller.formatCurrency.format(50000)}",
                                                    style: GoogleFonts.josefinSans(fontSize: 22, fontWeight: FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.pinkAccent.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              width: Get.height * 0.1225490196,
                                              height: Get.height * 0.02450980392,
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                        onTap: (){},
                                                        child: Icon(Icons.remove)
                                                    ),
                                                    Text(
                                                      "1",
                                                      style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                                                    ),
                                                    InkWell(
                                                        onTap: (){},
                                                        child: Icon(Icons.add)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                )
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
                          "Buy Now",
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
