import 'package:card_swiper/card_swiper.dart';
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
          child: Container(
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
                                      itemCount: 3,
                                      itemBuilder: (context, index){
                                        return Image.network(
                                          "https://img.inews.co.id/media/600/files/networks/2022/01/28/315b6_okezone.jpeg",
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      loop: false,
                                      pagination: SwiperPagination(),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    "Apple Watch Series 6",
                                    style: GoogleFonts.openSans(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  RatingBar.builder(
                                    initialRating: 3,
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
                                        "${controller.formatCurrency.format(50000)}",
                                        style: GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "Available in stock",
                                        style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Divider(thickness: 1,),
                                  SizedBox(height: 15,),
                                  Text(
                                      "About",
                                      style: GoogleFonts.josefinSans(fontSize: 26, fontWeight: FontWeight.w700)
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
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
                InkWell(
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
          )
      ),
    );
  }
}
