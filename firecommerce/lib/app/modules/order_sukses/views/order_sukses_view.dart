import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/order_sukses_controller.dart';

class OrderSuksesView extends GetView<OrderSuksesController> {
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
                          LottieBuilder.asset("asset/sukses.json"),
                          Text(
                            "Order Sukses",
                            style: GoogleFonts.josefinSans(fontSize: 50, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                ),
                InkWell(
                  onTap: (){
                    Get.offAllNamed(Routes.NAVBAR);
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
                          "Back to home",
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
