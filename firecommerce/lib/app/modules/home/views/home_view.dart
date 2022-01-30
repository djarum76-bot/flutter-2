import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
            width: Get.width,
            padding: EdgeInsets.all(Get.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(Routes.CART);
                      },
                      child: Container(
                        width: Get.height * 0.04901960784,
                        height: Get.height * 0.04901960784,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(LineIcons.shoppingCart),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: Get.height * 0.04901960784,
                        height: Get.height * 0.04901960784,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(LineIcons.search),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                StreamBuilder<QuerySnapshot<Object?>>(
                    stream: controller.streamDataUser(),
                    builder: (context, snapshot){
                      if(snapshot.connectionState == ConnectionState.active){
                        var listAllDocs = snapshot.data!.docs;
                        var data = listAllDocs[0].data() as Map<String, dynamic>;
                        return Text(
                          "Hello ${data["username"]}",
                          style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 30),
                        );
                      }
                      return Text(
                        "Hello User",
                        style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 30),
                      );
                    }
                ),
                Text(
                  "Butuh sesuatu ?",
                  style: GoogleFonts.openSans(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(height: 20,),
                Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index){
                        return index != 3
                            ? Container(
                                margin: EdgeInsets.only(right: Get.height * 0.025),
                                height: Get.height,
                                width: Get.width * 0.65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber,
                                ),
                              )
                            : Container(
                                height: Get.height,
                                width: Get.width * 0.65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber,
                                ),
                              );
                      }
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Text(
                        "SEE ALL",
                        style: GoogleFonts.openSans(fontSize: 16, color: Color(0xFFFF3B2F)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: Get.width,
                  height: Get.height * 0.07,
                  child: TabBar(
                      controller: controller.tabController,
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFFF3B2F)
                      ),
                      unselectedLabelColor: Color(0xFF8189B0),
                      labelColor: Color(0xFFFFFFFF),
                      tabs: [
                        Container(
                          height: Get.height,
                          width: Get.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Icon(LineIcons.tShirt, size: 30,),
                          ),
                        ),
                        Container(
                          height: Get.height,
                          width: Get.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Icon(LineIcons.desktop, size: 30,),
                          ),
                        ),
                        Container(
                          height: Get.height,
                          width: Get.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Icon(LineIcons.laptop, size: 30,),
                          ),
                        ),
                        Container(
                          height: Get.height,
                          width: Get.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Icon(LineIcons.gamepad, size: 30,),
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: Get.width,
                  height: Get.height * 0.261,
                  child: TabBarView(
                      controller: controller.tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index){
                                return index != 9
                                    ? InkWell(
                                        onTap: (){
                                          Get.toNamed(Routes.DETAIL);
                                        },
                                        child: Container(
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
                                        ),
                                      )
                                    : InkWell(
                                        onTap: (){
                                          Get.toNamed(Routes.DETAIL);
                                        },
                                        child: Container(
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
                                        ),
                                      );
                              }
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index){
                                return index != 9
                                    ? InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.DETAIL);
                                  },
                                  child: Container(
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
                                  ),
                                )
                                    : InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.DETAIL);
                                  },
                                  child: Container(
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
                                  ),
                                );
                              }
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index){
                                return index != 9
                                    ? InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.DETAIL);
                                  },
                                  child: Container(
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
                                  ),
                                )
                                    : InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.DETAIL);
                                  },
                                  child: Container(
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
                                  ),
                                );
                              }
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index){
                                return index != 9
                                    ? InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.DETAIL);
                                  },
                                  child: Container(
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
                                  ),
                                )
                                    : InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.DETAIL);
                                  },
                                  child: Container(
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
                                  ),
                                );
                              }
                          ),
                        ),
                      ]
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
