import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getUser(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: SpinKitPouringHourGlassRefined(
                        color: Colors.blueAccent
                    ),
                  );
                }else{
                  var data = controller.authC.user.value.user;
                  return Column(
                    children: [
                      Container(
                        height: Get.height * 0.06862745098,
                        width: Get.width,
                        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx((){
                              return Text(
                                "${controller.un.value}",
                                style: GoogleFonts.oxygen(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                ),
                              );
                            }),
                            GestureDetector(
                                onTap: (){
                                  Get.bottomSheet(
                                      Container(
                                        height: Get.height * 0.55,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF2B2B2B),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)
                                            )
                                        ),
                                        padding: EdgeInsets.all(Get.height * 0.01),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 10,),
                                            Image.asset("asset/garis.png"),
                                            SizedBox(height: 20,),
                                            Expanded(
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text("Pengaturan", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),),
                                                      leading: Icon(LineIcons.cog, color: Colors.white, size: 30,),
                                                      onTap: (){},
                                                    ),
                                                    ListTile(
                                                      title: Text("Arsip", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),),
                                                      leading: Icon(LineIcons.history, color: Colors.white, size: 30,),
                                                      onTap: (){},
                                                    ),
                                                    ListTile(
                                                      title: Text("Aktivitas Anda", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),),
                                                      leading: Icon(LineIcons.clock, color: Colors.white, size: 30,),
                                                      onTap: (){},
                                                    ),
                                                    ListTile(
                                                      title: Text("Kode QR", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),),
                                                      leading: Icon(LineIcons.qrcode, color: Colors.white, size: 30,),
                                                      onTap: (){},
                                                    ),
                                                    ListTile(
                                                      title: Text("Disimpan", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),),
                                                      leading: Icon(LineIcons.bookmark, color: Colors.white, size: 30,),
                                                      onTap: (){},
                                                    ),
                                                    ListTile(
                                                      title: Text("Teman Dekat", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 20),),
                                                      leading: Icon(LineIcons.list, color: Colors.white, size: 30,),
                                                      onTap: (){},
                                                    ),
                                                    ListTile(
                                                      title: Text("Keluar", style: GoogleFonts.oxygen(color: Colors.red, fontSize: 20),),
                                                      leading: Icon(LineIcons.doorOpen, color: Colors.red, size: 30,),
                                                      onTap: (){
                                                        controller.logout();
                                                      },
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      enableDrag: true
                                  );
                                },
                                child: Icon(LineIcons.bars, size: 30,)
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            child: ListView(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(Get.height * 0.02),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AvatarGlow(
                                        glowColor: Colors.blue,
                                        endRadius: 60.0,
                                        duration: Duration(milliseconds: 2000),
                                        repeat: true,
                                        showTwoGlows: true,
                                        repeatPauseDuration: Duration(milliseconds: 100),
                                        child: Material(     // Replace this child with your own
                                          elevation: 8.0,
                                          shape: CircleBorder(),
                                          child: Obx((){
                                            return controller.pp.value == ""
                                                ? CircleAvatar(
                                                    radius: 50,
                                                    backgroundColor: Colors.amber,
                                                  )
                                                : CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage: NetworkImage("${controller.pp.value}"),
                                                  );
                                          })
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Obx((){
                                            return Text(
                                              "${controller.gambarC.value}",
                                              style: GoogleFonts.oxygen(fontSize: 20, fontWeight: FontWeight.bold),
                                            );
                                          }),
                                          Text("Postingan",style: GoogleFonts.oxygen()),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox()
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox()
                                        ],
                                      ),
                                      // Column(
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //     Text("124", style: GoogleFonts.oxygen(fontSize: 20, fontWeight: FontWeight.bold)),
                                      //     Text("Pengikut", style: GoogleFonts.oxygen()),
                                      //   ],
                                      // ),
                                      // Column(
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //     Text("90", style: GoogleFonts.oxygen(fontSize: 20, fontWeight: FontWeight.bold)),
                                      //     Text("Mengikuti", style: GoogleFonts.oxygen()),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.toNamed(Routes.EDIT_PROFILE);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                                    child: Container(
                                      child: Center(
                                        child: Text("Edit Profil", style: GoogleFonts.oxygen(fontWeight: FontWeight.bold)),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black,),
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      padding: EdgeInsets.all(Get.height * 0.005),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(Get.height * 0.02),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Sorotan Cerita", style: GoogleFonts.oxygen(fontWeight: FontWeight.bold)),
                                          Obx((){
                                            return GestureDetector(
                                                onTap: (){
                                                  controller.sorotan.toggle();
                                                },
                                                child: controller.sorotan.value
                                                    ? Icon(LineIcons.angleUp, size: 18,)
                                                    : Icon(LineIcons.angleDown, size: 18,)
                                            );
                                          })
                                        ],
                                      ),
                                      Obx((){
                                        return controller.sorotan.value
                                            ? Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Simpan cerita favorit di profil anda", style: GoogleFonts.oxygen()),
                                              Container(
                                                width: Get.width,
                                                height: Get.height * 0.1,
                                                child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: 5,
                                                    itemBuilder: (context, index){
                                                      return Container(
                                                          margin: index != 4 ? EdgeInsets.only(right: Get.height * 0.02) : EdgeInsets.all(0),
                                                          child: index == 0
                                                              ? GestureDetector(
                                                            onTap: (){},
                                                            child: CircleAvatar(
                                                              radius: 30,
                                                              backgroundColor: Colors.black54,
                                                              child: Icon(LineIcons.plus, size: 35, color: Colors.white,),
                                                            ),
                                                          )
                                                              : CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor: Colors.black54,
                                                          )
                                                      );
                                                    }
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                            : SizedBox();
                                      }),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: DefaultTabController(
                                      length: 1,
                                      // length: 2,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            tabs: [
                                              Tab(icon: Icon(LineIcons.table, color: Colors.black,),),
                                              // Tab(icon: Icon(LineIcons.identificationBadge, color: Colors.black,),),
                                            ],
                                            indicatorColor: Colors.black,
                                          ),
                                          Container(
                                            height: Get.height * 0.511,
                                            child: TabBarView(
                                                children: [
                                                  Obx((){
                                                    return Container(
                                                        height: Get.height * 0.511,
                                                        child: controller.gambarC.value != 0
                                                            ? Obx((){
                                                          return GridView.builder(
                                                              itemCount: controller.gambarC.value,
                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount: 3,
                                                                  crossAxisSpacing: 4,
                                                                  mainAxisSpacing: 4
                                                              ),
                                                              itemBuilder: (context,indexPost){
                                                                return GestureDetector(
                                                                  onTap: (){
                                                                    Get.toNamed(Routes.POSTINGAN,arguments: data![0].posts![indexPost].id);
                                                                  },
                                                                  child: Container(
                                                                    height: Get.height * (1/3),
                                                                    width: Get.height * (1/3),
                                                                    child: Obx((){
                                                                      return Image.network(
                                                                        "${controller.gambarL.value[indexPost]}",
                                                                        fit: BoxFit.cover,
                                                                      );
                                                                    }),
                                                                  ),
                                                                );
                                                              }
                                                          );
                                                        })
                                                            : Center(
                                                          child: Text("Belum ada postingan"),
                                                        )
                                                    );
                                                  }),
                                                  // Container(
                                                  //   height: Get.height * 0.511,
                                                  //   child: GridView.builder(
                                                  //       itemCount: 4,
                                                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                  //           crossAxisCount: 3,
                                                  //           crossAxisSpacing: 4,
                                                  //           mainAxisSpacing: 4
                                                  //       ),
                                                  //       itemBuilder: (context,index){
                                                  //         return GestureDetector(
                                                  //           onTap: (){
                                                  //             Get.toNamed(Routes.DITANDAI);
                                                  //           },
                                                  //           child: Container(
                                                  //             height: Get.height * (1/3),
                                                  //             width: Get.height * (1/3),
                                                  //             color: Colors.amber,
                                                  //           ),
                                                  //         );
                                                  //       }
                                                  //   ),
                                                  // )
                                                ]
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                )
                              ],
                            ),
                          )
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
