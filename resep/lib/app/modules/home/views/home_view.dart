import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resep/app/custom/judul_tabbar.dart';
import 'package:resep/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.fromLTRB(Get.height * 0.025, Get.height * 0.025, Get.height * 0.025, Get.height * 0.02),
            child: Column(
              children: [
                Text(
                  "MasaKuy",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          FutureBuilder(
                              future: controller.getCategory(),
                              builder: (context, snapshot){
                                if(snapshot.connectionState == ConnectionState.done){
                                  return Container(
                                    child: TabBar(
                                      tabs: [
                                        JudulTabbar(judul: controller.serviceC.category.value.results![0].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![1].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![2].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![3].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![4].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![5].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![6].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![7].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![8].category!),
                                        JudulTabbar(judul: controller.serviceC.category.value.results![9].category!),
                                      ],
                                      controller: controller.tabController,
                                      isScrollable: true,
                                      labelStyle: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600
                                      ),
                                      labelColor: Colors.black,
                                      unselectedLabelColor: Colors.black,
                                      unselectedLabelStyle: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600
                                      ),
                                      indicatorColor: Color(0xFFFFAB73),
                                      indicatorSize: TabBarIndicatorSize.label,
                                    ),
                                    height: Get.height * 0.05,
                                  );
                                }
                                return Container(
                                  height: Get.height * 0.05,
                                  child: Shimmer.fromColors(
                                      enabled: true,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 10,
                                          itemBuilder: (context, index){
                                            return Container(
                                              height: Get.height,
                                              width: Get.height * 0.2,
                                              color: Colors.white,
                                              margin: EdgeInsets.only(right: Get.height * 0.04),
                                            );
                                          }
                                      ),
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!
                                  ),
                                );
                              }
                          ),
                          SizedBox(height: 50,),
                          Expanded(
                              child: Container(
                                child: TabBarView(
                                    controller: controller.tabController,
                                    children: [
                                      FutureBuilder(
                                          future: controller.getDesert(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.desert.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getHariRaya(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.hariRaya.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getTradisional(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.tradisional.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getMakanMalam(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.makanMalam.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getMakanSiang(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.makanSiang.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getAyam(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.ayam.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getDaging(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.daging.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getSayuran(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.sayuran.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getSeafood(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.seafood.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                      FutureBuilder(
                                          future: controller.getSarapan(),
                                          builder: (context, snapshot){
                                            if(snapshot.connectionState == ConnectionState.done){
                                              var data = controller.serviceC.sarapan.value.results!;
                                              return Container(
                                                child: Swiper(
                                                    pagination: SwiperPagination(),
                                                    loop: false,
                                                    itemCount: data.length,
                                                    viewportFraction: 0.8,
                                                    scale: 0.9,
                                                    itemBuilder: (context, index){
                                                      return GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed(Routes.DETAIL, arguments: [data[index].key, data[index].thumb]);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: Container(
                                                                width: Get.height,
                                                                height: Get.height * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    color: Colors.red
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.height,
                                                                      height: Get.height * 0.48,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage('${data[index].thumb}'),
                                                                              fit: BoxFit.fill
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                            topRight: Radius.circular(30),
                                                                            topLeft: Radius.circular(30),
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30),
                                                                                bottomRight: Radius.circular(30),
                                                                              )
                                                                          ),
                                                                          width: Get.width,
                                                                          padding: EdgeInsets.all(Get.height * 0.015),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(
                                                                                "${data[index].title}",
                                                                                style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600),
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                softWrap: false,
                                                                              ),
                                                                              Text(
                                                                                "${data[index].times}, ${data[index].dificulty}",
                                                                                style: TextStyle(
                                                                                    fontFamily: "SFProText",
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF404040)
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              );
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                    ]
                                ),
                              )
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}
