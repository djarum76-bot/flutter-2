import 'package:bane/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getBerita(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height * 0.48,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${controller.networkC.berita.value.articles![0].urlToImage}"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(Get.height * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: Get.height * 0.17156862745,
                                height: Get.height * 0.03676470588,
                                child: Center(
                                  child: Text(
                                    "News of the day",
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.2)
                                ),
                              ),
                              SizedBox(height: 50,),
                              Text(
                                "${controller.networkC.berita.value.articles![0].title}",
                                style: GoogleFonts.merriweatherSans(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.DETAIL, arguments: [
                                    controller.networkC.berita.value.articles![0].urlToImage,
                                    controller.networkC.berita.value.articles![0].title,
                                    controller.networkC.berita.value.articles![0].description,
                                    controller.networkC.berita.value.articles![0].author,
                                    controller.networkC.berita.value.articles![0].publishedAt,
                                    controller.networkC.berita.value.articles![0].content,
                                  ]);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Read More",
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Icon(
                                      LineIcons.arrowRight,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.417,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        padding: EdgeInsets.all(Get.height * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Breaking News",
                                  style: GoogleFonts.merriweatherSans(fontSize: 26, fontWeight: FontWeight.bold,),
                                ),
                                InkWell(
                                  onTap: (){},
                                  child: Text(
                                      "More",
                                      style: GoogleFonts.merriweatherSans(fontSize: 20, fontWeight: FontWeight.bold)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: controller.networkC.berita.value.articles!.length - 1,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index){
                                      var i = index + 1;
                                      return i != controller.networkC.berita.value.articles!.length - 1
                                          ? InkWell(
                                              onTap: (){
                                                Get.toNamed(Routes.DETAIL, arguments: [
                                                  controller.networkC.berita.value.articles![i].urlToImage,
                                                  controller.networkC.berita.value.articles![i].title,
                                                  controller.networkC.berita.value.articles![i].description,
                                                  controller.networkC.berita.value.articles![i].author,
                                                  controller.networkC.berita.value.articles![i].publishedAt,
                                                  controller.networkC.berita.value.articles![i].content,
                                                ]);
                                              },
                                              child: Container(
                                                width: Get.height * 0.24509803921,
                                                margin: EdgeInsets.only(right: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Get.height * 0.24509803921,
                                                      height: Get.height * 0.14705882352,
                                                      decoration: BoxDecoration(
                                                          color: Colors.yellow,
                                                          borderRadius: BorderRadius.circular(20),
                                                          image: DecorationImage(
                                                              image: NetworkImage("${controller.networkC.berita.value.articles![i].urlToImage}"),
                                                              fit: BoxFit.cover
                                                          )
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text(
                                                      "${controller.networkC.berita.value.articles![i].title}",
                                                      style: GoogleFonts.merriweatherSans(fontSize: 20, fontWeight: FontWeight.bold,),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      softWrap: false,
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      "${timeago.format(controller.networkC.berita.value.articles![i].publishedAt!)}",
                                                      style: GoogleFonts.openSans(),
                                                    ),
                                                    Text(
                                                      "By ${controller.networkC.berita.value.articles![i].author}",
                                                      style: GoogleFonts.openSans(fontSize: 16),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      softWrap: false,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: (){
                                                Get.toNamed(Routes.DETAIL, arguments: [
                                                  controller.networkC.berita.value.articles![i].urlToImage,
                                                  controller.networkC.berita.value.articles![i].title,
                                                  controller.networkC.berita.value.articles![i].description,
                                                  controller.networkC.berita.value.articles![i].author,
                                                  controller.networkC.berita.value.articles![i].publishedAt,
                                                  controller.networkC.berita.value.articles![i].content,
                                                ]);
                                              },
                                              child: Container(
                                                width: Get.height * 0.24509803921,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Get.height * 0.24509803921,
                                                      height: Get.height * 0.14705882352,
                                                      decoration: BoxDecoration(
                                                          color: Colors.yellow,
                                                          borderRadius: BorderRadius.circular(20),
                                                          image: DecorationImage(
                                                              image: NetworkImage("${controller.networkC.berita.value.articles![i].urlToImage}"),
                                                              fit: BoxFit.cover
                                                          )
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text(
                                                      "${controller.networkC.berita.value.articles![i].title}",
                                                      style: GoogleFonts.merriweatherSans(fontSize: 20, fontWeight: FontWeight.bold,),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      softWrap: false,
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      "${timeago.format(controller.networkC.berita.value.articles![i].publishedAt!)}",
                                                      style: GoogleFonts.openSans(),
                                                    ),
                                                    Text(
                                                      "By ${controller.networkC.berita.value.articles![i].author}",
                                                      style: GoogleFonts.openSans(fontSize: 16),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      softWrap: false,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                    }
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
              }
          )
      ),
    );
  }
}
