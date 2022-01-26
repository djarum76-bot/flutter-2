import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.55,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${Get.arguments[0]}"),
                      fit: BoxFit.cover
                  )
                ),
                padding: EdgeInsets.only(left: Get.height * 0.035, right: Get.height * 0.035, bottom: Get.height * 0.095, top: Get.height * 0.035),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(LineIcons.arrowLeft, color: Colors.white, size: 40,),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "${Get.arguments[1]}",
                            style: GoogleFonts.merriweatherSans(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "${Get.arguments[2]}",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 16
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        )
                    ),
                    padding: EdgeInsets.only(left: Get.height * 0.035, right: Get.height * 0.035, top: Get.height * 0.035, bottom: Get.height * 0.02),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.0122549019607843),
                                height: Get.height * 0.04901960784,
                                child: Center(
                                  child: Text(
                                    "${Get.arguments[3]}",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        color: Colors.white
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.0122549019607843),
                                height: Get.height * 0.04901960784,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LineIcons.clock
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "${timeago.format(Get.arguments[4])}",
                                      style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          color: Colors.black
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.2)
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "${Get.arguments[5]}",
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
