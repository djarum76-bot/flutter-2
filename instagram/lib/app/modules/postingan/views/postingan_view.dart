import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/postingan_controller.dart';

class PostinganView extends GetView<PostinganController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getPost(Get.arguments),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: SpinKitPouringHourGlassRefined(
                        color: Colors.blueAccent
                    ),
                  );
                }else{
                  return Column(
                    children: [
                      Container(
                        height: Get.height * 0.06862745098,
                        width: Get.width,
                        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Icon(LineIcons.arrowLeft, size: 30,),
                            ),
                            SizedBox(width: 8,),
                            Text(
                              "Postingan",
                              style: GoogleFonts.oxygen(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          controller.authC.post.value.post![0].user!.image != null
                                              ? CircleAvatar(
                                                  radius: 15,
                                                  backgroundImage: NetworkImage("${controller.authC.post.value.post![0].user!.image}"),
                                                )
                                              : CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: Colors.amber,
                                                ),
                                          SizedBox(width: 6,),
                                          Text(
                                            "${controller.authC.post.value.post![0].user!.username}",
                                            style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            Get.bottomSheet(
                                                Container(
                                                  height: Get.height * 0.479,
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
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                ListTile(
                                                                  title: Text("Salin Tautan", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                                ListTile(
                                                                  title: Text("Arsipkan", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                                ListTile(
                                                                  title: Text("Hapus", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){
                                                                    controller.deletePost(controller.authC.post.value.post![0].id!);
                                                                    Get.back();
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  title: Text("Edit", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                                ListTile(
                                                                  title: Text("Sembunyikan Jumlah Suka", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                                ListTile(
                                                                  title: Text("Nonaktifkan Komentar", style: GoogleFonts.oxygen(color: Colors.white, fontSize: 18),),
                                                                  onTap: (){},
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                enableDrag: true
                                            );
                                          },
                                          child: Icon(LineIcons.verticalEllipsis)
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                GestureDetector(
                                  onDoubleTap: (){
                                    controller.likeUnlike(controller.authC.post.value.post![0].id!);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    height: Get.height * 0.3,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("${controller.authC.post.value.post![0].image}"),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Obx((){
                                                return GestureDetector(
                                                  onTap: (){
                                                    controller.likeUnlike(controller.authC.post.value.post![0].id!);
                                                  },
                                                  child: controller.liked.value
                                                      ? Icon(Icons.favorite, size: 24, color: Colors.red,)
                                                      : Icon(Icons.favorite_outline, size: 24,),
                                                );
                                              }),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: (){
                                                  Get.toNamed(Routes.KOMEN,arguments: controller.authC.post.value.post![0].id);
                                                },
                                                child: Icon(LineIcons.cloud, color: Colors.black,),
                                              ),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: (){},
                                                child: Icon(LineIcons.telegramPlane, color: Colors.black,),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: (){},
                                            child: Icon(LineIcons.bookmark, color: Colors.black,),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8,),
                                      Obx((){
                                        return controller.likeC.value == 0
                                            ? SizedBox()
                                            : Text(
                                          "${controller.likeC.value} Suka",
                                          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
                                        );
                                      }),
                                      SizedBox(height: 4,),
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "${controller.authC.post.value.post![0].user!.username}",
                                                  style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text: " ${controller.authC.post.value.post![0].body}",
                                                  style: GoogleFonts.oxygen(fontSize: 16, color: Colors.black,),
                                                )
                                              ]
                                          )
                                      ),
                                      SizedBox(height: 4,),
                                      Obx((){
                                        return controller.comment.value == 0
                                            ? SizedBox()
                                            : GestureDetector(
                                          onTap: (){
                                            Get.toNamed(Routes.KOMEN,arguments: controller.authC.post.value.post![0].id);
                                          },
                                          child: Material(
                                            child: Text(
                                              "Lihat semua ${controller.comment.value} komentar",
                                              style: GoogleFonts.oxygen(fontSize: 16, color: Colors.grey),
                                            ),
                                          ),
                                        );
                                      }),
                                      Text(
                                        "${timeago.format(controller.authC.post.value.post![0].createdAt!,locale: 'id')}",
                                        style: GoogleFonts.oxygen(fontSize: 10, color: Colors.grey),
                                      ),
                                      SizedBox(height: 16,),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
