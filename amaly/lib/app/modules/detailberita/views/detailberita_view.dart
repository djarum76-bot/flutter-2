import 'package:amaly/app/custom/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detailberita_controller.dart';

class DetailberitaView extends GetView<DetailberitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(msg: "Detail Berita",),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(Get.height * 0.02),
                    width: Get.width,
                    child: ListView(
                      children: [
                        Container(
                          height: Get.height * 0.27,
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: Get.width * 0.07,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (){},
                                        child: Material(
                                          borderRadius: BorderRadius.circular(10),
                                          elevation: 2,
                                          child: Container(
                                            width: Get.width * 0.1,
                                            height: Get.width * 0.1,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFFFFFF),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Icon(Icons.thumb_up_alt_outlined, color: Color(0xFF1DAD9B),),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      InkWell(
                                        onTap: (){},
                                        child: Material(
                                          borderRadius: BorderRadius.circular(10),
                                          elevation: 2,
                                          child: Container(
                                            width: Get.width * 0.1,
                                            height: Get.width * 0.1,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFFFFFF),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Icon(Icons.share_outlined, color: Color(0xFF1DAD9B),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Cirebon - 18 August 2021",
                                style: GoogleFonts.openSans(fontSize: 10,fontWeight: FontWeight.w600, color: Colors.grey),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "Wakil Wali Kota Cirebon Hadiri Acara Khitan Masal Gratis",
                                style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF000000)),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "4 Hours ago",
                                style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFFCACACA)),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "Excited him now natural saw passage offices you minuter. At by asked being court hopes. Farther so friends am to detract. Forbade concern do private be. Offending residence but men engrossed shy. Pretend am earnest offered arrived company so on. Felicity informed yet had admitted strictly how you.Quick six blind smart out burst. Perfectly on furniture dejection determine my depending an to. Add short water court fat. Her bachelor honoured perceive securing but desirous ham required. Questions deficient acuteness to engrossed as. Entirely led ten humoured greatest and yourself. Besides ye country on observe. She continue appetite endeavor she judgment interest the met. For she surrounded motionless fat resolution may. He oppose at thrown desire of no. Announcing impression unaffected day his are unreserved indulgence. Him hard find read are you sang. Parlors visited noisier how explain pleased his see suppose. Do ashamed assured on related offence at equally totally. Use mile her whom they its. Kept hold an want as he bred of. Was dashwood landlord cheerful husbands two. Estate why theirs indeed him polite old settle though she. In as at regard easily narrow roused adieus.",
                                style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
              Material(
                elevation: 10,
                child: Container(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: Get.height * 0.01,bottom: Get.height * 0.01),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Komentar",
                                  fillColor: Colors.grey.withOpacity(0.1),
                                  filled: true,
                                  hintStyle: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFFCACACA))
                              ),
                            ),
                          )
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.only(bottom: Get.height * 0.01),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.01),
                            radius: 30,
                            child: SvgPicture.asset(
                              "asset/icon/send.svg",
                              color: Color(0xFFCACACA),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}

// import 'package:amaly/app/custom/CustomAppBar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'package:get/get.dart';
//
// import '../controllers/detailberita_controller.dart';
//
// class DetailberitaView extends GetView<DetailberitaController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//             children: [
//               CustomAppBar(msg: "Detail Berita",),
//               Container(
//                 width: Get.width,
//                 height: Get.height * 0.84,
//                 child: ListView(
//                   children: [],
//                 ),
//               )
//             ],
//           )
//       ),
//       floatingActionButton: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(left: 20),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         fillColor: Colors.grey.withOpacity(0.1)
//                     ),
//                   ),
//                 )
//             ),
//             InkWell(
//               onTap: (){},
//               child: CircleAvatar(
//                 backgroundColor: Colors.grey.withOpacity(0.01),
//                 radius: 30,
//                 child: SvgPicture.asset(
//                   "asset/icon/send.svg",
//                   color: Color(0xFFCACACA),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }