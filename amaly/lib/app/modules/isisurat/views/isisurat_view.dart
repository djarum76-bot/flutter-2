import 'package:amaly/app/custom/CustomAppBarAlQuran.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/isisurat_controller.dart';

class IsisuratView extends GetView<IsisuratController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: controller.obx((data){
            return Column(
              children: [
                CustomAppBarAlQuran(msg: "${data!["nama_latin"]}"),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset("asset/icon/bismillah.png"),
                ),
                Container(
                  height: Get.height * 0.7,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data["ayat"].length,
                      itemBuilder: (context, index){
                        return Container(
                          width: Get.width,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height:  Get.height * 0.3 * 0.3,
                                decoration: BoxDecoration(
                                    color: Color(0xFF1DAD9B),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      child: Text("${index + 1}", style: TextStyle(color: Color(0xFF1DAD9B)),),
                                      backgroundColor: Colors.white,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.share_outlined, color: Colors.white,)
                                        ),
                                        Obx((){
                                          return IconButton(
                                              onPressed: (){
                                                controller.isPlay.toggle();
                                              },
                                              icon: Icon(
                                                controller.isPlay.value ? Icons.pause_outlined : Icons.play_arrow_outlined,
                                                color: Colors.white,
                                              )
                                          );
                                        }),
                                        Obx((){
                                          return IconButton(
                                              onPressed: (){
                                                controller.isFavor.toggle();
                                              },
                                              icon: Icon(
                                                controller.isFavor.value ? Icons.bookmark : Icons.bookmark_border_outlined,
                                                color: Colors.white,
                                              )
                                          );
                                        }),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 25,),
                              Flexible(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "${data["ayat"][index]["ar"]}",
                                            style: GoogleFonts.amiri(fontWeight: FontWeight.w700, fontSize: 18, color: Color(0xFF333333)),
                                            textAlign: TextAlign.right,
                                          ),
                                          alignment: Alignment.centerRight,
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          child: Text(
                                            "${data["ayat"][index]["idn"]}",
                                            style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF333333)),
                                            textAlign: TextAlign.justify,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        );
                      }
                  ),
                )
              ],
            );
          })
      )
    );
  }
}
