import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/app/routes/app_pages.dart';
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
              future: controller.getPosts(),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gabut",
                              style: GoogleFonts.pacifico(
                                  fontSize: 24
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     GestureDetector(
                            //         onTap: (){},
                            //         child: Icon(LineIcons.heart, size: 30,)
                            //     ),
                            //     SizedBox(width: 10,),
                            //     GestureDetector(
                            //         onTap: (){
                            //           Get.toNamed(Routes.PESAN);
                            //         },
                            //         child: Icon(LineIcons.facebookMessenger, size: 30,)
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            child: ListView(
                              children: [
                                controller.authC.posts.value.posts!.length == 0
                                    ? FutureBuilder(
                                    future: controller.getStories(),
                                    builder: (context,snapshot){
                                      if(snapshot.connectionState == ConnectionState.waiting){
                                        return Center(
                                          child: SpinKitPouringHourGlassRefined(
                                              color: Colors.blueAccent,
                                              size: 30,
                                          ),
                                        );
                                      }else{
                                        return Container(
                                          width: Get.width,
                                          height: Get.height * 0.06862745098 * 1.7,
                                          padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller.authC.stories.value.user!.length,
                                              itemBuilder: (context, indexS){
                                                return Container(
                                                    margin: indexS != controller.authC.stories.value.user!.length-1 ? EdgeInsets.only(right: Get.height * 0.012) : EdgeInsets.all(0),
                                                    child: controller.authC.stories.value.user![indexS].storiesCount != 0
                                                        ? GestureDetector(
                                                      onTap: (){
                                                        Get.toNamed(Routes.STORY);
                                                      },
                                                      child: Column(
                                                        children: [
                                                          controller.authC.stories.value.user![indexS].image == null
                                                              ? CircleAvatar(
                                                            radius: 35,
                                                            backgroundColor: Colors.deepOrangeAccent,
                                                            child: CircleAvatar(
                                                              radius: 33,
                                                              backgroundColor: Colors.black,
                                                            ),
                                                          )
                                                              : CircleAvatar(
                                                            radius: 35,
                                                            backgroundColor: Colors.deepOrangeAccent,
                                                            child: CircleAvatar(
                                                              radius: 33,
                                                              backgroundImage: NetworkImage("${controller.authC.stories.value.user![indexS].image}"),
                                                            ),
                                                          ),
                                                          SizedBox(height: 6,),
                                                          Text("${controller.authC.stories.value.user![indexS].username}", style: GoogleFonts.oxygen(fontSize: 14),)
                                                        ],
                                                      ),
                                                    )
                                                        : SizedBox()
                                                );
                                              }
                                          ),
                                        );
                                      }
                                    }
                                )
                                    : Container(
                                        height: Get.height * 0.828,
                                        child: ListView.builder(
                                            itemCount: controller.authC.posts.value.posts!.length,
                                            itemBuilder: (context, index){
                                              var data = controller.authC.posts.value.posts![index];
                                              return index == 0
                                                  ? Container(
                                                      child: Column(
                                                        children: [
                                                          FutureBuilder(
                                                              future: controller.getStories(),
                                                              builder: (context,snapshot){
                                                                if(snapshot.connectionState == ConnectionState.waiting){
                                                                  return Center(
                                                                    child: SpinKitPouringHourGlassRefined(
                                                                        color: Colors.blueAccent,
                                                                        size: 30,
                                                                    ),
                                                                  );
                                                                }else{
                                                                  return Container(
                                                                    width: Get.width,
                                                                    height: Get.height * 0.06862745098 * 1.7,
                                                                    padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                                                                    child: ListView.builder(
                                                                        scrollDirection: Axis.horizontal,
                                                                        itemCount: controller.authC.stories.value.user!.length,
                                                                        itemBuilder: (context, indexS){
                                                                          return Container(
                                                                              margin: indexS != controller.authC.stories.value.user!.length-1 ? EdgeInsets.only(right: Get.height * 0.012) : EdgeInsets.all(0),
                                                                              child: controller.authC.stories.value.user![indexS].storiesCount != 0
                                                                                ? GestureDetector(
                                                                                    onTap: (){
                                                                                      Get.toNamed(Routes.STORY);
                                                                                    },
                                                                                    child: Column(
                                                                                      children: [
                                                                                        controller.authC.stories.value.user![indexS].image == null
                                                                                            ? CircleAvatar(
                                                                                                radius: 35,
                                                                                                backgroundColor: Colors.deepOrangeAccent,
                                                                                                child: CircleAvatar(
                                                                                                  radius: 33,
                                                                                                  backgroundColor: Colors.black,
                                                                                                ),
                                                                                              )
                                                                                            : CircleAvatar(
                                                                                                radius: 35,
                                                                                                backgroundColor: Colors.deepOrangeAccent,
                                                                                                child: CircleAvatar(
                                                                                                  radius: 33,
                                                                                                  backgroundImage: NetworkImage("${controller.authC.stories.value.user![indexS].image}"),
                                                                                                ),
                                                                                              ),
                                                                                        SizedBox(height: 6,),
                                                                                        Text("${controller.authC.stories.value.user![indexS].username}", style: GoogleFonts.oxygen(fontSize: 14),)
                                                                                      ],
                                                                                    ),
                                                                                  )
                                                                                : SizedBox()
                                                                          );
                                                                        }
                                                                    ),
                                                                  );
                                                                }
                                                              }
                                                          ),
                                                          Divider(color: Colors.grey),
                                                          Container(
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
                                                                          data.user!.image != null
                                                                              ? CircleAvatar(
                                                                                  radius: 15,
                                                                                  backgroundImage: NetworkImage("${data.user!.image}"),
                                                                                )
                                                                              : CircleAvatar(
                                                                                  radius: 15,
                                                                                  backgroundColor: Colors.amber,
                                                                                ),
                                                                          SizedBox(width: 6,),
                                                                          Text(
                                                                            "${data.user!.username}",
                                                                            style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      // GestureDetector(
                                                                      //     onTap: (){
                                                                      //       Get.bottomSheet(
                                                                      //           Container(
                                                                      //             height: Get.height * 0.36764705882,
                                                                      //             decoration: BoxDecoration(
                                                                      //                 color: Color(0xFF2B2B2B),
                                                                      //                 borderRadius: BorderRadius.only(
                                                                      //                     topLeft: Radius.circular(20),
                                                                      //                     topRight: Radius.circular(20)
                                                                      //                 )
                                                                      //             ),
                                                                      //             child: Column(
                                                                      //               crossAxisAlignment: CrossAxisAlignment.start,
                                                                      //               children: [
                                                                      //                 Container(
                                                                      //                   padding: EdgeInsets.all(Get.height * 0.01),
                                                                      //                   child: Column(
                                                                      //                     children: [
                                                                      //                       SizedBox(height: 10,),
                                                                      //                       Image.asset("asset/garis.png"),
                                                                      //                       SizedBox(height: 20,),
                                                                      //                       Row(
                                                                      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      //                         children: [
                                                                      //                           GestureDetector(
                                                                      //                             onTap: (){},
                                                                      //                             child: Column(
                                                                      //                               children: [
                                                                      //                                 CircleAvatar(
                                                                      //                                   radius: 27,
                                                                      //                                   backgroundColor: Colors.white,
                                                                      //                                   child: CircleAvatar(
                                                                      //                                     radius: 25,
                                                                      //                                     child: Icon(LineIcons.link, size: 25, color: Colors.white,),
                                                                      //                                     backgroundColor: Color(0xFF2B2B2B),
                                                                      //                                   ),
                                                                      //                                 ),
                                                                      //                                 SizedBox(height: 8,),
                                                                      //                                 Text(
                                                                      //                                   "Tautan",
                                                                      //                                   style: GoogleFonts.quicksand(color: Colors.white),
                                                                      //                                 )
                                                                      //                               ],
                                                                      //                             ),
                                                                      //                           ),
                                                                      //                           GestureDetector(
                                                                      //                             onTap: (){},
                                                                      //                             child: Column(
                                                                      //                               children: [
                                                                      //                                 CircleAvatar(
                                                                      //                                   radius: 27,
                                                                      //                                   backgroundColor: Colors.white,
                                                                      //                                   child: CircleAvatar(
                                                                      //                                     radius: 25,
                                                                      //                                     child: Icon(LineIcons.share, size: 25, color: Colors.white,),
                                                                      //                                     backgroundColor: Color(0xFF2B2B2B),
                                                                      //                                   ),
                                                                      //                                 ),
                                                                      //                                 SizedBox(height: 8,),
                                                                      //                                 Text(
                                                                      //                                   "Bagikan",
                                                                      //                                   style: GoogleFonts.quicksand(color: Colors.white),
                                                                      //                                 )
                                                                      //                               ],
                                                                      //                             ),
                                                                      //                           ),
                                                                      //                           GestureDetector(
                                                                      //                             onTap: (){},
                                                                      //                             child: Column(
                                                                      //                               children: [
                                                                      //                                 CircleAvatar(
                                                                      //                                   radius: 27,
                                                                      //                                   backgroundColor: Colors.redAccent,
                                                                      //                                   child: CircleAvatar(
                                                                      //                                     radius: 25,
                                                                      //                                     child: Icon(LineIcons.exclamationCircle, size: 30, color: Colors.redAccent,),
                                                                      //                                     backgroundColor: Color(0xFF2B2B2B),
                                                                      //                                   ),
                                                                      //                                 ),
                                                                      //                                 SizedBox(height: 8,),
                                                                      //                                 Text(
                                                                      //                                   "Laporkan",
                                                                      //                                   style: GoogleFonts.quicksand(color: Colors.white),
                                                                      //                                 )
                                                                      //                               ],
                                                                      //                             ),
                                                                      //                           )
                                                                      //                         ],
                                                                      //                       )
                                                                      //                     ],
                                                                      //                   ),
                                                                      //                 ),
                                                                      //                 Divider(color: Colors.grey.withOpacity(0.5),thickness: 0.5,),
                                                                      //                 InkWell(
                                                                      //                   onTap: (){},
                                                                      //                   child: Container(
                                                                      //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                      //                     child: Text(
                                                                      //                       "Mengapa anda melihat postingan ini",
                                                                      //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                      //                     ),
                                                                      //                   ),
                                                                      //                 ),
                                                                      //                 Divider(color: Colors.grey.withOpacity(0.5),thickness: 0.5,),
                                                                      //                 InkWell(
                                                                      //                   onTap: (){},
                                                                      //                   child: Container(
                                                                      //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                      //                     child: Text(
                                                                      //                       "Sembunyikan",
                                                                      //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                      //                     ),
                                                                      //                   ),
                                                                      //                 ),
                                                                      //                 SizedBox(height: 10,),
                                                                      //                 InkWell(
                                                                      //                   onTap: (){},
                                                                      //                   child: Container(
                                                                      //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                      //                     child: Text(
                                                                      //                       "Tentang akun ini",
                                                                      //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                      //                     ),
                                                                      //                   ),
                                                                      //                 ),
                                                                      //                 SizedBox(height: 10,),
                                                                      //                 InkWell(
                                                                      //                   onTap: (){},
                                                                      //                   child: Container(
                                                                      //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                      //                     child: Text(
                                                                      //                       "Berhenti mengikuti",
                                                                      //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                      //                     ),
                                                                      //                   ),
                                                                      //                 )
                                                                      //               ],
                                                                      //             ),
                                                                      //           ),
                                                                      //           enableDrag: true
                                                                      //       );
                                                                      //     },
                                                                      //     child: Icon(LineIcons.verticalEllipsis)
                                                                      // )
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(height: 8,),
                                                                GestureDetector(
                                                                  onDoubleTap: (){
                                                                    controller.likeUnlike(data.id!);
                                                                  },
                                                                  child: Container(
                                                                    width: Get.width,
                                                                    height: Get.height * 0.3,
                                                                    decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                            image: NetworkImage("${data.image}"),
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
                                                                                    controller.likeUnlike(data.id!);
                                                                                  },
                                                                                  child: controller.liked.value[index]
                                                                                      ? Icon(Icons.favorite, size: 24, color: Colors.red,)
                                                                                      : Icon(Icons.favorite_outline, size: 24,),
                                                                                );
                                                                              }),
                                                                              SizedBox(width: 5,),
                                                                              GestureDetector(
                                                                                onTap: (){
                                                                                  Get.toNamed(Routes.KOMEN,arguments: data.id);
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
                                                                        return controller.likeC.value[index] == 0
                                                                            ? SizedBox()
                                                                            : Text(
                                                                          "${controller.likeC.value[index]} Suka",
                                                                          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
                                                                        );
                                                                      }),
                                                                      SizedBox(height: 4,),
                                                                      RichText(
                                                                          text: TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: "${data.user!.username}",
                                                                                  style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: " ${data.body}",
                                                                                  style: GoogleFonts.oxygen(fontSize: 16, color: Colors.black,),
                                                                                )
                                                                              ]
                                                                          )
                                                                      ),
                                                                      SizedBox(height: 4,),
                                                                      Obx((){
                                                                        return controller.comment.value[index] == 0
                                                                            ? SizedBox()
                                                                            : GestureDetector(
                                                                          onTap: (){
                                                                            Get.toNamed(Routes.KOMEN,arguments: data.id);
                                                                          },
                                                                          child: Material(
                                                                            child: Text(
                                                                              "Lihat semua ${controller.comment.value[index]} komentar",
                                                                              style: GoogleFonts.oxygen(fontSize: 16, color: Colors.grey),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                      Text(
                                                                        "${timeago.format(data.createdAt!,locale: 'id')}",
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
                                                        ],
                                                      ),
                                                    )
                                                  : Container(
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
                                                                    data.user!.image != null
                                                                        ? CircleAvatar(
                                                                      radius: 15,
                                                                      backgroundImage: NetworkImage("${data.user!.image}"),
                                                                    )
                                                                        : CircleAvatar(
                                                                      radius: 15,
                                                                      backgroundColor: Colors.amber,
                                                                    ),
                                                                    SizedBox(width: 6,),
                                                                    Text(
                                                                      "${data.user!.username}",
                                                                      style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
                                                                    )
                                                                  ],
                                                                ),
                                                                // GestureDetector(
                                                                //     onTap: (){
                                                                //       Get.bottomSheet(
                                                                //           Container(
                                                                //             height: Get.height * 0.36764705882,
                                                                //             decoration: BoxDecoration(
                                                                //                 color: Color(0xFF2B2B2B),
                                                                //                 borderRadius: BorderRadius.only(
                                                                //                     topLeft: Radius.circular(20),
                                                                //                     topRight: Radius.circular(20)
                                                                //                 )
                                                                //             ),
                                                                //             child: Column(
                                                                //               crossAxisAlignment: CrossAxisAlignment.start,
                                                                //               children: [
                                                                //                 Container(
                                                                //                   padding: EdgeInsets.all(Get.height * 0.01),
                                                                //                   child: Column(
                                                                //                     children: [
                                                                //                       SizedBox(height: 10,),
                                                                //                       Image.asset("asset/garis.png"),
                                                                //                       SizedBox(height: 20,),
                                                                //                       Row(
                                                                //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                //                         children: [
                                                                //                           GestureDetector(
                                                                //                             onTap: (){},
                                                                //                             child: Column(
                                                                //                               children: [
                                                                //                                 CircleAvatar(
                                                                //                                   radius: 27,
                                                                //                                   backgroundColor: Colors.white,
                                                                //                                   child: CircleAvatar(
                                                                //                                     radius: 25,
                                                                //                                     child: Icon(LineIcons.link, size: 25, color: Colors.white,),
                                                                //                                     backgroundColor: Color(0xFF2B2B2B),
                                                                //                                   ),
                                                                //                                 ),
                                                                //                                 SizedBox(height: 8,),
                                                                //                                 Text(
                                                                //                                   "Tautan",
                                                                //                                   style: GoogleFonts.quicksand(color: Colors.white),
                                                                //                                 )
                                                                //                               ],
                                                                //                             ),
                                                                //                           ),
                                                                //                           GestureDetector(
                                                                //                             onTap: (){},
                                                                //                             child: Column(
                                                                //                               children: [
                                                                //                                 CircleAvatar(
                                                                //                                   radius: 27,
                                                                //                                   backgroundColor: Colors.white,
                                                                //                                   child: CircleAvatar(
                                                                //                                     radius: 25,
                                                                //                                     child: Icon(LineIcons.share, size: 25, color: Colors.white,),
                                                                //                                     backgroundColor: Color(0xFF2B2B2B),
                                                                //                                   ),
                                                                //                                 ),
                                                                //                                 SizedBox(height: 8,),
                                                                //                                 Text(
                                                                //                                   "Bagikan",
                                                                //                                   style: GoogleFonts.quicksand(color: Colors.white),
                                                                //                                 )
                                                                //                               ],
                                                                //                             ),
                                                                //                           ),
                                                                //                           GestureDetector(
                                                                //                             onTap: (){},
                                                                //                             child: Column(
                                                                //                               children: [
                                                                //                                 CircleAvatar(
                                                                //                                   radius: 27,
                                                                //                                   backgroundColor: Colors.redAccent,
                                                                //                                   child: CircleAvatar(
                                                                //                                     radius: 25,
                                                                //                                     child: Icon(LineIcons.exclamationCircle, size: 30, color: Colors.redAccent,),
                                                                //                                     backgroundColor: Color(0xFF2B2B2B),
                                                                //                                   ),
                                                                //                                 ),
                                                                //                                 SizedBox(height: 8,),
                                                                //                                 Text(
                                                                //                                   "Laporkan",
                                                                //                                   style: GoogleFonts.quicksand(color: Colors.white),
                                                                //                                 )
                                                                //                               ],
                                                                //                             ),
                                                                //                           )
                                                                //                         ],
                                                                //                       )
                                                                //                     ],
                                                                //                   ),
                                                                //                 ),
                                                                //                 Divider(color: Colors.grey.withOpacity(0.5),thickness: 0.5,),
                                                                //                 InkWell(
                                                                //                   onTap: (){},
                                                                //                   child: Container(
                                                                //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                //                     child: Text(
                                                                //                       "Mengapa anda melihat postingan ini",
                                                                //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                //                     ),
                                                                //                   ),
                                                                //                 ),
                                                                //                 Divider(color: Colors.grey.withOpacity(0.5),thickness: 0.5,),
                                                                //                 InkWell(
                                                                //                   onTap: (){},
                                                                //                   child: Container(
                                                                //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                //                     child: Text(
                                                                //                       "Sembunyikan",
                                                                //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                //                     ),
                                                                //                   ),
                                                                //                 ),
                                                                //                 SizedBox(height: 10,),
                                                                //                 InkWell(
                                                                //                   onTap: (){},
                                                                //                   child: Container(
                                                                //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                //                     child: Text(
                                                                //                       "Tentang akun ini",
                                                                //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                //                     ),
                                                                //                   ),
                                                                //                 ),
                                                                //                 SizedBox(height: 10,),
                                                                //                 InkWell(
                                                                //                   onTap: (){},
                                                                //                   child: Container(
                                                                //                     padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
                                                                //                     child: Text(
                                                                //                       "Berhenti mengikuti",
                                                                //                       style: GoogleFonts.oxygen(color: Colors.white, fontSize: 17),
                                                                //                     ),
                                                                //                   ),
                                                                //                 )
                                                                //               ],
                                                                //             ),
                                                                //           ),
                                                                //           enableDrag: true
                                                                //       );
                                                                //     },
                                                                //     child: Icon(LineIcons.verticalEllipsis)
                                                                // )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 8,),
                                                          GestureDetector(
                                                            onDoubleTap: (){
                                                              controller.likeUnlike(data.id!);
                                                            },
                                                            child: Container(
                                                              width: Get.width,
                                                              height: Get.height * 0.3,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: NetworkImage("${data.image}"),
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
                                                                              controller.likeUnlike(data.id!);
                                                                            },
                                                                            child: controller.liked.value[index]
                                                                                ? Icon(Icons.favorite, size: 24, color: Colors.red,)
                                                                                : Icon(Icons.favorite_outline, size: 24,),
                                                                          );
                                                                        }),
                                                                        SizedBox(width: 5,),
                                                                        GestureDetector(
                                                                          onTap: (){
                                                                            Get.toNamed(Routes.KOMEN,arguments: data.id);
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
                                                                  return controller.likeC.value[index] == 0
                                                                      ? SizedBox()
                                                                      : Text(
                                                                    "${controller.likeC.value[index]} Suka",
                                                                    style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
                                                                  );
                                                                }),
                                                                SizedBox(height: 4,),
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text: "${data.user!.username}",
                                                                            style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                                          ),
                                                                          TextSpan(
                                                                            text: " ${data.body}",
                                                                            style: GoogleFonts.oxygen(fontSize: 16, color: Colors.black,),
                                                                          )
                                                                        ]
                                                                    )
                                                                ),
                                                                SizedBox(height: 4,),
                                                                Obx((){
                                                                  return controller.comment.value[index] == 0
                                                                      ? SizedBox()
                                                                      : GestureDetector(
                                                                    onTap: (){
                                                                      Get.toNamed(Routes.KOMEN,arguments: data.id);
                                                                    },
                                                                    child: Material(
                                                                      child: Text(
                                                                        "Lihat semua ${controller.comment.value[index]} komentar",
                                                                        style: GoogleFonts.oxygen(fontSize: 16, color: Colors.grey),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                                Text(
                                                                  "${timeago.format(data.createdAt!,locale: 'id')}",
                                                                  style: GoogleFonts.oxygen(fontSize: 10, color: Colors.grey),
                                                                ),
                                                                SizedBox(height: 16,),
                                                              ],
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                            }
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

// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';
//
// import '../controllers/home_controller.dart';
//
// class HomeView extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Column(
//             children: [
//               Container(
//                 height: Get.height * 0.06862745098,
//                 width: Get.width,
//                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Gabut",
//                       style: GoogleFonts.pacifico(
//                           fontSize: 24
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                             onPressed: (){},
//                             icon: Icon(LineIcons.heart, size: 30,)
//                         ),
//                         IconButton(
//                             onPressed: (){},
//                             icon: Icon(LineIcons.facebookMessenger, size: 30,)
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                     child: ListView(
//                       children: [
//                         Container(
//                           width: Get.width,
//                           height: Get.height * 0.06862745098 * 1.5,
//                           padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
//                           child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: 10,
//                               itemBuilder: (context, index){
//                                 return Container(
//                                   margin: index != 9 ? EdgeInsets.only(right: Get.height * 0.012) : EdgeInsets.all(0),
//                                   child: CircleAvatar(
//                                     radius: 35,
//                                     backgroundColor: Colors.deepOrangeAccent,
//                                     child: CircleAvatar(
//                                       radius: 33,
//                                       backgroundColor: Colors.black,
//                                     ),
//                                   ),
//                                 );
//                               }
//                           ),
//                         ),
//                         Divider(color: Colors.grey),
//                         Container(
//                           height: Get.height * 0.706,
//                           child: ListView.builder(
//                               itemCount: 5,
//                               itemBuilder: (context, index){
//                                 return Container(
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                               children: [
//                                                 CircleAvatar(
//                                                   radius: 15,
//                                                   backgroundColor: Colors.amber,
//                                                 ),
//                                                 SizedBox(width: 6,),
//                                                 Text(
//                                                   "User",
//                                                   style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
//                                                 )
//                                               ],
//                                             ),
//                                             IconButton(
//                                                 onPressed: (){
//                                                   Get.bottomSheet(
//                                                       Container(
//                                                         height: Get.height * 0.36764705882,
//                                                         decoration: BoxDecoration(
//                                                             color: Color(0xFF2B2B2B),
//                                                             borderRadius: BorderRadius.circular(20)
//                                                         ),
//                                                         child: Column(
//                                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                                           children: [
//                                                             Container(
//                                                               padding: EdgeInsets.all(Get.height * 0.01),
//                                                               child: Column(
//                                                                 children: [
//                                                                   SizedBox(height: 10,),
//                                                                   Image.asset("asset/garis.png"),
//                                                                   SizedBox(height: 20,),
//                                                                   Row(
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                                     children: [
//                                                                       GestureDetector(
//                                                                         onTap: (){},
//                                                                         child: Column(
//                                                                           children: [
//                                                                             CircleAvatar(
//                                                                               radius: 27,
//                                                                               backgroundColor: Colors.white,
//                                                                               child: CircleAvatar(
//                                                                                 radius: 25,
//                                                                                 child: Icon(LineIcons.link, size: 25, color: Colors.white,),
//                                                                                 backgroundColor: Color(0xFF2B2B2B),
//                                                                               ),
//                                                                             ),
//                                                                             SizedBox(height: 8,),
//                                                                             Text(
//                                                                               "Tautan",
//                                                                               style: GoogleFonts.quicksand(color: Colors.white),
//                                                                             )
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                       GestureDetector(
//                                                                         onTap: (){},
//                                                                         child: Column(
//                                                                           children: [
//                                                                             CircleAvatar(
//                                                                               radius: 27,
//                                                                               backgroundColor: Colors.white,
//                                                                               child: CircleAvatar(
//                                                                                 radius: 25,
//                                                                                 child: Icon(LineIcons.share, size: 25, color: Colors.white,),
//                                                                                 backgroundColor: Color(0xFF2B2B2B),
//                                                                               ),
//                                                                             ),
//                                                                             SizedBox(height: 8,),
//                                                                             Text(
//                                                                               "Bagikan",
//                                                                               style: GoogleFonts.quicksand(color: Colors.white),
//                                                                             )
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                       GestureDetector(
//                                                                         onTap: (){},
//                                                                         child: Column(
//                                                                           children: [
//                                                                             CircleAvatar(
//                                                                               radius: 27,
//                                                                               backgroundColor: Colors.redAccent,
//                                                                               child: CircleAvatar(
//                                                                                 radius: 25,
//                                                                                 child: Icon(LineIcons.exclamationCircle, size: 30, color: Colors.redAccent,),
//                                                                                 backgroundColor: Color(0xFF2B2B2B),
//                                                                               ),
//                                                                             ),
//                                                                             SizedBox(height: 8,),
//                                                                             Text(
//                                                                               "Laporkan",
//                                                                               style: GoogleFonts.quicksand(color: Colors.white),
//                                                                             )
//                                                                           ],
//                                                                         ),
//                                                                       )
//                                                                     ],
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             Divider(color: Colors.grey.withOpacity(0.5),thickness: 0.5,),
//                                                             InkWell(
//                                                               onTap: (){},
//                                                               child: Container(
//                                                                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
//                                                                 child: Text(
//                                                                   "Mengapa anda melihat postingan ini",
//                                                                   style: GoogleFonts.quicksand(color: Colors.white, fontSize: 17),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Divider(color: Colors.grey.withOpacity(0.5),thickness: 0.5,),
//                                                             InkWell(
//                                                               onTap: (){},
//                                                               child: Container(
//                                                                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
//                                                                 child: Text(
//                                                                   "Sembunyikan",
//                                                                   style: GoogleFonts.quicksand(color: Colors.white, fontSize: 17),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(height: 10,),
//                                                             InkWell(
//                                                               onTap: (){},
//                                                               child: Container(
//                                                                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
//                                                                 child: Text(
//                                                                   "Tentang akun ini",
//                                                                   style: GoogleFonts.quicksand(color: Colors.white, fontSize: 17),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(height: 10,),
//                                                             InkWell(
//                                                               onTap: (){},
//                                                               child: Container(
//                                                                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02,),
//                                                                 child: Text(
//                                                                   "Berhenti mengikuti",
//                                                                   style: GoogleFonts.quicksand(color: Colors.white, fontSize: 17),
//                                                                 ),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       enableDrag: true
//                                                   );
//                                                 },
//                                                 icon: Icon(LineIcons.verticalEllipsis)
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                         height: Get.height * 0.3,
//                                         color: Colors.blue,
//                                       ),
//                                       SizedBox(height: 8,),
//                                       Container(
//                                         padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     GestureDetector(
//                                                       onTap: (){},
//                                                       child: Icon(LineIcons.heart, color: Colors.black,),
//                                                     ),
//                                                     SizedBox(width: 5,),
//                                                     GestureDetector(
//                                                       onTap: (){},
//                                                       child: Icon(LineIcons.cloud, color: Colors.black,),
//                                                     ),
//                                                     SizedBox(width: 5,),
//                                                     GestureDetector(
//                                                       onTap: (){},
//                                                       child: Icon(LineIcons.telegramPlane, color: Colors.black,),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 GestureDetector(
//                                                   onTap: (){},
//                                                   child: Icon(LineIcons.bookmark, color: Colors.black,),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(height: 8,),
//                                             Text(
//                                               "560 Suka",
//                                               style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16),
//                                             ),
//                                             SizedBox(height: 4,),
//                                             RichText(
//                                                 text: TextSpan(
//                                                     children: [
//                                                       TextSpan(
//                                                         text: "User",
//                                                         style: GoogleFonts.oxygen(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                       ),
//                                                       TextSpan(
//                                                         text: " Selamat Pagi",
//                                                         style: GoogleFonts.oxygen(fontSize: 16, color: Colors.black,),
//                                                       )
//                                                     ]
//                                                 )
//                                             ),
//                                             SizedBox(height: 4,),
//                                             GestureDetector(
//                                               onTap: (){},
//                                               child: Material(
//                                                 child: Text(
//                                                   "Lihat semua 36 komentar",
//                                                   style: GoogleFonts.oxygen(fontSize: 16, color: Colors.grey),
//                                                 ),
//                                               ),
//                                             ),
//                                             Text(
//                                               "3 jam yang lalu",
//                                               style: GoogleFonts.oxygen(fontSize: 10, color: Colors.grey),
//                                             ),
//                                             SizedBox(height: 4,),
//                                           ],
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               }
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//               )
//             ],
//           )
//       ),
//     );
//   }
// }
