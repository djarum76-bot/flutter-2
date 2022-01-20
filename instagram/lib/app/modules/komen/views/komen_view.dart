import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/komen_controller.dart';

class KomenView extends GetView<KomenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getComments(Get.arguments),
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
                          child: Obx((){
                            return Container(
                                child: controller.authC.post.value.post![0].comments!.length == 0
                                    ? Container(
                                        width: Get.width,
                                        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
                                        margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            controller.authC.post.value.post![0].user!.image == null
                                                ? CircleAvatar(
                                                    backgroundColor: Colors.amber,
                                                    radius: 23,
                                                  )
                                                : CircleAvatar(
                                                    radius: 23,
                                                    backgroundImage: NetworkImage("${controller.authC.post.value.post![0].user!.image!}"),
                                                  ),
                                            SizedBox(width: 8,),
                                            Flexible(
                                                child: RichText(
                                                  text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "${controller.authC.post.value.post![0].user!.username} ",
                                                          style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                        ),
                                                        TextSpan(
                                                          text: " ${controller.authC.post.value.post![0].body}\n\n",
                                                          style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
                                                        ),
                                                        TextSpan(
                                                          text: "${timeago.format(controller.authC.post.value.post![0].createdAt!,locale: 'id')}",
                                                          style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
                                                        ),
                                                      ]
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      )
                                    : Obx((){
                                        return ListView.builder(
                                            itemCount: controller.authC.post.value.post![0].comments!.length,
                                            itemBuilder: (context, index){
                                              return index == 0
                                                  ? Container(
                                                      child: Obx((){
                                                        return Column(
                                                          children: [
                                                            Container(
                                                              width: Get.width,
                                                              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
                                                              margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  controller.authC.post.value.post![0].user!.image == null
                                                                      ? CircleAvatar(
                                                                          backgroundColor: Colors.amber,
                                                                          radius: 23,
                                                                        )
                                                                      : CircleAvatar(
                                                                          radius: 23,
                                                                          backgroundImage: NetworkImage("${controller.authC.post.value.post![0].user!.image!}"),
                                                                        ),
                                                                  SizedBox(width: 8,),
                                                                  Flexible(
                                                                      child: RichText(
                                                                        text: TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: "${controller.authC.post.value.post![0].user!.username} ",
                                                                                style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                                              ),
                                                                              TextSpan(
                                                                                text: " ${controller.authC.post.value.post![0].body}\n\n",
                                                                                style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
                                                                              ),
                                                                              TextSpan(
                                                                                text: "${timeago.format(controller.authC.post.value.post![0].createdAt!,locale: 'id')}",
                                                                                style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
                                                                              ),
                                                                            ]
                                                                        ),
                                                                      )
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(color: Colors.grey),
                                                            Obx((){
                                                              return Container(
                                                                width: Get.width,
                                                                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
                                                                margin: EdgeInsets.only(top: Get.height * 0.01),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    controller.authC.post.value.post![0].comments![index].user!.image == null
                                                                        ? CircleAvatar(
                                                                            backgroundColor: Colors.amber,
                                                                            radius: 23,
                                                                          )
                                                                        : CircleAvatar(
                                                                            radius: 23,
                                                                            backgroundImage: NetworkImage("${controller.authC.post.value.post![0].comments![index].user!.image}"),
                                                                          ),
                                                                    SizedBox(width: 8,),
                                                                    Flexible(
                                                                        child: Obx(((){
                                                                          return RichText(
                                                                            text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: "${controller.komen.value[index].user!.username} ",
                                                                                    style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: " ${controller.komen.value[index].comment}\n",
                                                                                    style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: "${timeago.format(controller.komen.value[index].createdAt!,locale: 'id')}",
                                                                                    style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
                                                                                  ),
                                                                                ]
                                                                            ),
                                                                          );
                                                                        }))
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            })
                                                          ],
                                                        );
                                                      }),
                                                    )
                                                  : Obx((){
                                                      return Container(
                                                        width: Get.width,
                                                        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
                                                        margin: EdgeInsets.only(top: Get.height * 0.015),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            controller.authC.post.value.post![0].comments![index].user!.image == null
                                                                ? CircleAvatar(
                                                              backgroundColor: Colors.amber,
                                                              radius: 23,
                                                            )
                                                                : CircleAvatar(
                                                              radius: 23,
                                                              backgroundImage: NetworkImage("${controller.authC.post.value.post![0].comments![index].user!.image}"),
                                                            ),
                                                            SizedBox(width: 8,),
                                                            Flexible(
                                                                child: Obx(((){
                                                                  return RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text: "${controller.komen.value[index].user!.username} ",
                                                                            style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                                                          ),
                                                                          TextSpan(
                                                                            text: " ${controller.komen.value[index].comment}\n",
                                                                            style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
                                                                          ),
                                                                          TextSpan(
                                                                            text: "${timeago.format(controller.komen.value[index].createdAt!,locale: 'id')}",
                                                                            style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
                                                                          ),
                                                                        ]
                                                                    ),
                                                                  );
                                                                }))
                                                            )
                                                          ],
                                                        ),
                                                      );
                                              });
                                            }
                                        );
                                })
                            );
                          })
                      ),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01,vertical: Get.height * 0.001),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.black26, width: 0.5)
                            )
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 23,
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      hintText: "Berkomentar sebagai ${controller.authC.box.read('username')}",
                                      border: InputBorder.none
                                  ),
                                  controller: controller.comment,
                                  onSaved: (String? e) => controller.comment.text = e!,
                                )
                            ),
                            SizedBox(width: 8,),
                            GestureDetector(
                              onTap: (){
                                if(controller.comment.text.isEmpty){

                                }else{
                                  controller.createComment(Get.arguments);
                                }
                              },
                              child: Text("Kirim", style: TextStyle(color: Colors.blue),),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import '../controllers/komen_controller.dart';
//
// class KomenView extends GetView<KomenController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: FutureBuilder(
//               future: controller.getComments(Get.arguments),
//               builder: (context, snapshot){
//                 if(snapshot.connectionState == ConnectionState.waiting){
//                   return Center(
//                     child: SpinKitPouringHourGlassRefined(
//                         color: Colors.blueAccent
//                     ),
//                   );
//                 }else{
//                   return Column(
//                     children: [
//                       Container(
//                         height: Get.height * 0.06862745098,
//                         width: Get.width,
//                         padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
//                         child: Row(
//                           children: [
//                             GestureDetector(
//                               onTap: (){
//                                 Get.back();
//                               },
//                               child: Icon(LineIcons.arrowLeft, size: 30,),
//                             ),
//                             SizedBox(width: 8,),
//                             Text(
//                               "Postingan",
//                               style: GoogleFonts.oxygen(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                           child: Container(
//                               child: controller.authC.post.value.post![0].comments!.length == 0
//                                   ? Container(
//                                 width: Get.width,
//                                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                 margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     controller.authC.post.value.post![0].user!.image == null
//                                         ? CircleAvatar(
//                                       backgroundColor: Colors.amber,
//                                       radius: 23,
//                                     )
//                                         : CircleAvatar(
//                                       radius: 23,
//                                       backgroundImage: NetworkImage("${controller.authC.post.value.post![0].user!.image!}"),
//                                     ),
//                                     SizedBox(width: 8,),
//                                     Flexible(
//                                         child: RichText(
//                                           text: TextSpan(
//                                               children: [
//                                                 TextSpan(
//                                                   text: "${controller.authC.post.value.post![0].user!.username} ",
//                                                   style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                 ),
//                                                 TextSpan(
//                                                   text: " ${controller.authC.post.value.post![0].body}\n\n",
//                                                   style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                 ),
//                                                 TextSpan(
//                                                   text: "${timeago.format(controller.authC.post.value.post![0].createdAt!,locale: 'id')}",
//                                                   style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                 ),
//                                               ]
//                                           ),
//                                         )
//                                     )
//                                   ],
//                                 ),
//                               )
//                                   : ListView.builder(
//                                   itemCount: controller.authC.post.value.post![0].comments!.length,
//                                   itemBuilder: (context, index){
//                                     return index == 0
//                                         ? Container(
//                                       child: Obx((){
//                                         return Column(
//                                           children: [
//                                             Container(
//                                               width: Get.width,
//                                               padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                               margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   controller.authC.post.value.post![0].user!.image == null
//                                                       ? CircleAvatar(
//                                                     backgroundColor: Colors.amber,
//                                                     radius: 23,
//                                                   )
//                                                       : CircleAvatar(
//                                                     radius: 23,
//                                                     backgroundImage: NetworkImage("${controller.authC.post.value.post![0].user!.image!}"),
//                                                   ),
//                                                   SizedBox(width: 8,),
//                                                   Flexible(
//                                                       child: RichText(
//                                                         text: TextSpan(
//                                                             children: [
//                                                               TextSpan(
//                                                                 text: "${controller.authC.post.value.post![0].user!.username} ",
//                                                                 style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                               ),
//                                                               TextSpan(
//                                                                 text: " ${controller.authC.post.value.post![0].body}\n\n",
//                                                                 style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                               ),
//                                                               TextSpan(
//                                                                 text: "${timeago.format(controller.authC.post.value.post![0].createdAt!,locale: 'id')}",
//                                                                 style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                               ),
//                                                             ]
//                                                         ),
//                                                       )
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                             Divider(color: Colors.grey),
//                                             Obx((){
//                                               return Container(
//                                                 width: Get.width,
//                                                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                                 margin: EdgeInsets.only(top: Get.height * 0.01),
//                                                 child: Row(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     // data.comments![index].user!.image == null
//                                                     //     ? CircleAvatar(
//                                                     //   backgroundColor: Colors.amber,
//                                                     //   radius: 23,
//                                                     // )
//                                                     //     : CircleAvatar(
//                                                     //   radius: 23,
//                                                     //   backgroundImage: NetworkImage("${data.comments![index].user!.image!}"),
//                                                     // ),
//                                                     controller.authC.post.value.post![0].comments![index].user!.image == null
//                                                         ? CircleAvatar(
//                                                       backgroundColor: Colors.amber,
//                                                       radius: 23,
//                                                     )
//                                                         : CircleAvatar(
//                                                       radius: 23,
//                                                       backgroundImage: NetworkImage("${controller.authC.post.value.post![0].comments![index].user!.image}"),
//                                                     ),
//                                                     SizedBox(width: 8,),
//                                                     Flexible(
//                                                         child: Obx(((){
//                                                           return RichText(
//                                                             text: TextSpan(
//                                                                 children: [
//                                                                   TextSpan(
//                                                                     text: "${controller.komen.value[index].user!.username} ",
//                                                                     style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                                   ),
//                                                                   TextSpan(
//                                                                     text: " ${controller.komen.value[index].comment}\n",
//                                                                     style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                                   ),
//                                                                   TextSpan(
//                                                                     text: "${timeago.format(controller.komen.value[index].createdAt!,locale: 'id')}",
//                                                                     style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                                   ),
//                                                                 ]
//                                                             ),
//                                                           );
//                                                         }))
//                                                     )
//                                                   ],
//                                                 ),
//                                               );
//                                             })
//                                           ],
//                                         );
//                                       }),
//                                     )
//                                         : Obx((){
//                                       return Container(
//                                         width: Get.width,
//                                         padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                         margin: EdgeInsets.only(top: Get.height * 0.015),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             controller.authC.post.value.post![0].comments![index].user!.image == null
//                                                 ? CircleAvatar(
//                                               backgroundColor: Colors.amber,
//                                               radius: 23,
//                                             )
//                                                 : CircleAvatar(
//                                               radius: 23,
//                                               backgroundImage: NetworkImage("${controller.authC.post.value.post![0].comments![index].user!.image}"),
//                                             ),
//                                             SizedBox(width: 8,),
//                                             Flexible(
//                                                 child: Obx(((){
//                                                   return RichText(
//                                                     text: TextSpan(
//                                                         children: [
//                                                           TextSpan(
//                                                             text: "${controller.komen.value[index].user!.username} ",
//                                                             style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                           ),
//                                                           TextSpan(
//                                                             text: " ${controller.komen.value[index].comment}\n",
//                                                             style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                           ),
//                                                           TextSpan(
//                                                             text: "${timeago.format(controller.komen.value[index].createdAt!,locale: 'id')}",
//                                                             style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                           ),
//                                                         ]
//                                                     ),
//                                                   );
//                                                 }))
//                                             )
//                                             // Flexible(
//                                             //     child: RichText(
//                                             //       text: TextSpan(
//                                             //           children: [
//                                             //             TextSpan(
//                                             //               text: "${data.comments![index].user!.username!} ",
//                                             //               style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                             //             ),
//                                             //             TextSpan(
//                                             //               text: " ${data.comments![index].comment}\n",
//                                             //               style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                             //             ),
//                                             //             TextSpan(
//                                             //               text: "${timeago.format(data.comments![index].createdAt!,locale: 'id')}",
//                                             //               style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                             //             ),
//                                             //           ]
//                                             //       ),
//                                             //     )
//                                             // )
//                                           ],
//                                         ),
//                                       );
//                                     });
//                                   }
//                               )
//                           )
//                       ),
//                       Container(
//                         width: Get.width,
//                         padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01,vertical: Get.height * 0.001),
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(color: Colors.black26, width: 0.5)
//                             )
//                         ),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.amber,
//                               radius: 23,
//                             ),
//                             SizedBox(width: 8,),
//                             Expanded(
//                                 child: TextFormField(
//                                   keyboardType: TextInputType.multiline,
//                                   maxLines: null,
//                                   decoration: InputDecoration(
//                                       hintText: "Berkomentar sebagai ${controller.authC.box.read('username')}",
//                                       border: InputBorder.none
//                                   ),
//                                   controller: controller.comment,
//                                   onSaved: (String? e) => controller.comment.text = e!,
//                                 )
//                             ),
//                             SizedBox(width: 8,),
//                             GestureDetector(
//                               onTap: (){
//                                 if(controller.comment.text.isEmpty){
//
//                                 }else{
//                                   controller.createComment(Get.arguments);
//                                 }
//                               },
//                               child: Text("Kirim", style: TextStyle(color: Colors.blue),),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   );
//                 }
//               }
//           )
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import '../controllers/komen_controller.dart';
//
// class KomenView extends GetView<KomenController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: FutureBuilder(
//               future: controller.getComments(Get.arguments),
//               builder: (context, snapshot){
//                 if(snapshot.connectionState == ConnectionState.waiting){
//                   return Center(
//                     child: SpinKitPouringHourGlassRefined(
//                         color: Colors.blueAccent
//                     ),
//                   );
//                 }else{
//                   var data = controller.authC.post.value.post![0];
//                   return Column(
//                     children: [
//                       Container(
//                         height: Get.height * 0.06862745098,
//                         width: Get.width,
//                         padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
//                         child: Row(
//                           children: [
//                             GestureDetector(
//                               onTap: (){
//                                 Get.back();
//                               },
//                               child: Icon(LineIcons.arrowLeft, size: 30,),
//                             ),
//                             SizedBox(width: 8,),
//                             Text(
//                               "Postingan",
//                               style: GoogleFonts.oxygen(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                           child: Container(
//                               child: data.commentsCount == 0
//                                   ? Container(
//                                 width: Get.width,
//                                 padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                 margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     data.user!.image == null
//                                         ? CircleAvatar(
//                                       backgroundColor: Colors.amber,
//                                       radius: 23,
//                                     )
//                                         : CircleAvatar(
//                                       radius: 23,
//                                       backgroundImage: NetworkImage("${data.user!.image!}"),
//                                     ),
//                                     SizedBox(width: 8,),
//                                     Flexible(
//                                         child: RichText(
//                                           text: TextSpan(
//                                               children: [
//                                                 TextSpan(
//                                                   text: "${data.user!.username} ",
//                                                   style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                 ),
//                                                 TextSpan(
//                                                   text: " ${data.body}\n\n",
//                                                   style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                 ),
//                                                 TextSpan(
//                                                   text: "${timeago.format(data.createdAt!,locale: 'id')}",
//                                                   style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                 ),
//                                               ]
//                                           ),
//                                         )
//                                     )
//                                   ],
//                                 ),
//                               )
//                                   : ListView.builder(
//                                   itemCount: data.commentsCount,
//                                   itemBuilder: (context, index){
//                                     return index == 0
//                                         ? Container(
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             width: Get.width,
//                                             padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                             margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 data.user!.image == null
//                                                     ? CircleAvatar(
//                                                   backgroundColor: Colors.amber,
//                                                   radius: 23,
//                                                 )
//                                                     : CircleAvatar(
//                                                   radius: 23,
//                                                   backgroundImage: NetworkImage("${data.user!.image!}"),
//                                                 ),
//                                                 SizedBox(width: 8,),
//                                                 Flexible(
//                                                     child: RichText(
//                                                       text: TextSpan(
//                                                           children: [
//                                                             TextSpan(
//                                                               text: "${data.user!.username} ",
//                                                               style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                             ),
//                                                             TextSpan(
//                                                               text: " ${data.body}\n\n",
//                                                               style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                             ),
//                                                             TextSpan(
//                                                               text: "${timeago.format(data.createdAt!,locale: 'id')}",
//                                                               style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                             ),
//                                                           ]
//                                                       ),
//                                                     )
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           Divider(color: Colors.grey),
//                                           Container(
//                                             width: Get.width,
//                                             padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                             margin: EdgeInsets.only(top: Get.height * 0.01),
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 // data.comments![index].user!.image == null
//                                                 //     ? CircleAvatar(
//                                                 //   backgroundColor: Colors.amber,
//                                                 //   radius: 23,
//                                                 // )
//                                                 //     : CircleAvatar(
//                                                 //   radius: 23,
//                                                 //   backgroundImage: NetworkImage("${data.comments![index].user!.image!}"),
//                                                 // ),
//                                                 data.comments![index].user!.image == null
//                                                     ? CircleAvatar(
//                                                   backgroundColor: Colors.amber,
//                                                   radius: 23,
//                                                 )
//                                                     : CircleAvatar(
//                                                   radius: 23,
//                                                   backgroundImage: NetworkImage("${data.comments![index].user!.image}"),
//                                                 ),
//                                                 SizedBox(width: 8,),
//                                                 Flexible(
//                                                     child: Obx((){
//                                                       return RichText(
//                                                         text: TextSpan(
//                                                             children: [
//                                                               TextSpan(
//                                                                 text: "${controller.komen.value[index].user!.username} ",
//                                                                 style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                               ),
//                                                               TextSpan(
//                                                                 text: " ${controller.komen.value[index].comment}\n",
//                                                                 style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                               ),
//                                                               TextSpan(
//                                                                 text: "${timeago.format(controller.komen.value[index].createdAt!,locale: 'id')}",
//                                                                 style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                               ),
//                                                             ]
//                                                         ),
//                                                       );
//                                                     })
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                         : Container(
//                                       width: Get.width,
//                                       padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015),
//                                       margin: EdgeInsets.only(top: Get.height * 0.015),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           data.comments![index].user!.image == null
//                                               ? CircleAvatar(
//                                             backgroundColor: Colors.amber,
//                                             radius: 23,
//                                           )
//                                               : CircleAvatar(
//                                             radius: 23,
//                                             backgroundImage: NetworkImage("${data.comments![index].user!.image}"),
//                                           ),
//                                           SizedBox(width: 8,),
//                                           Flexible(
//                                               child: Obx((){
//                                                 return RichText(
//                                                   text: TextSpan(
//                                                       children: [
//                                                         TextSpan(
//                                                           text: "${controller.komen.value[index].user!.username} ",
//                                                           style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                                         ),
//                                                         TextSpan(
//                                                           text: " ${controller.komen.value[index].comment}\n",
//                                                           style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                                         ),
//                                                         TextSpan(
//                                                           text: "${timeago.format(controller.komen.value[index].createdAt!,locale: 'id')}",
//                                                           style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                                         ),
//                                                       ]
//                                                   ),
//                                                 );
//                                               })
//                                           )
//                                           // Flexible(
//                                           //     child: RichText(
//                                           //       text: TextSpan(
//                                           //           children: [
//                                           //             TextSpan(
//                                           //               text: "${data.comments![index].user!.username!} ",
//                                           //               style: GoogleFonts.actor(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//                                           //             ),
//                                           //             TextSpan(
//                                           //               text: " ${data.comments![index].comment}\n",
//                                           //               style: GoogleFonts.actor(fontSize: 16, color: Colors.black,),
//                                           //             ),
//                                           //             TextSpan(
//                                           //               text: "${timeago.format(data.comments![index].createdAt!,locale: 'id')}",
//                                           //               style: GoogleFonts.actor(fontSize: 10, color: Colors.grey),
//                                           //             ),
//                                           //           ]
//                                           //       ),
//                                           //     )
//                                           // )
//                                         ],
//                                       ),
//                                     );
//                                   }
//                               )
//                           )
//                       ),
//                       Container(
//                         width: Get.width,
//                         padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01,vertical: Get.height * 0.001),
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(color: Colors.black26, width: 0.5)
//                             )
//                         ),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.amber,
//                               radius: 23,
//                             ),
//                             SizedBox(width: 8,),
//                             Expanded(
//                                 child: TextFormField(
//                                   keyboardType: TextInputType.multiline,
//                                   maxLines: null,
//                                   decoration: InputDecoration(
//                                       hintText: "Berkomentar sebagai ${controller.authC.box.read('username')}",
//                                       border: InputBorder.none
//                                   ),
//                                   controller: controller.comment,
//                                   onSaved: (String? e) => controller.comment.text = e!,
//                                 )
//                             ),
//                             SizedBox(width: 8,),
//                             GestureDetector(
//                               onTap: (){
//                                 if(controller.comment.text.isEmpty){
//
//                                 }else{
//                                   controller.createComment(Get.arguments);
//                                 }
//                               },
//                               child: Text("Kirim", style: TextStyle(color: Colors.blue),),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   );
//                 }
//               }
//           )
//       ),
//     );
//   }
// }
