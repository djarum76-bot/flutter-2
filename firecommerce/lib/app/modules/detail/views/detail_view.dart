import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: StreamBuilder<DocumentSnapshot<Object?>>(
              stream: controller.getProduct(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.active){
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  return Container(
                    padding: EdgeInsets.all(Get.height * 0.02),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                              child: Column(
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
                                          alignment: Alignment.centerLeft,
                                          child: Icon(LineIcons.arrowLeft, size: 30,),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: ListView(
                                        children: [
                                          SizedBox(height: 20,),
                                          Container(
                                            width: Get.width,
                                            height: Get.height * 0.38,
                                            child: Swiper(
                                              itemCount: 1,
                                              itemBuilder: (context, index){
                                                return Image.network(
                                                  "${data["gambar"]}",
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                              loop: false,
                                              pagination: SwiperPagination(),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Text(
                                            "${data["nama_produk"]}",
                                            style: GoogleFonts.openSans(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          SizedBox(height: 4,),
                                          RatingBar.builder(
                                            initialRating: data["rating"].toDouble(),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.zero,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                            itemSize: 30,
                                          ),
                                          SizedBox(height: 6,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${controller.formatCurrency.format(data["harga"])}",
                                                style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700),
                                              ),
                                              data["stok"] != 0
                                                  ? Text(
                                                "Available in stock",
                                                style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w500),
                                              )
                                                  : Text(
                                                "Stock not available",
                                                style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Divider(thickness: 1,),
                                          SizedBox(height: 15,),
                                          Text(
                                              "Tentang Produk",
                                              style: GoogleFonts.josefinSans(fontSize: 26, fontWeight: FontWeight.w700)
                                          ),
                                          SizedBox(height: 20,),
                                          Text(
                                            "${data["deskripsi"]}",
                                            style: GoogleFonts.josefinSans(fontSize: 20),
                                            textAlign: TextAlign.justify,
                                          ),
                                          SizedBox(height: 20,)
                                        ],
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
                        data["uid_penjual"] == controller.authC.box.read('uid')
                          ? Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                      onTap: (){
                                      },
                                      child: Material(
                                        borderRadius: BorderRadius.circular(20),
                                        elevation: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white
                                          ),
                                          height: Get.height * 0.075,
                                          child: Center(
                                            child: Text(
                                              "Edit",
                                              style: GoogleFonts.openSans(color: Colors.deepOrangeAccent, fontSize: 22),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                    child: InkWell(
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
                                          height: Get.height * 0.075,
                                          child: Center(
                                            child: Text(
                                              "Hapus",
                                              style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                )
                              ],
                            )
                          : InkWell(
                              onTap: (){
                                Get.offNamed(Routes.CART);
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
                                      "Add To Cart",
                                      style: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                            )
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
    );
  }
}
