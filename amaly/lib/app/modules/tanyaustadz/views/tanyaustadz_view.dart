import 'package:amaly/app/custom/CustomAppBar.dart';
import 'package:amaly/app/custom/Tombol.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tanyaustadz_controller.dart';

class TanyaustadzView extends GetView<TanyaustadzController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(msg: "Tanya Ustadz",),
              Container(
                padding: EdgeInsets.all(Get.width * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: Colors.black,),
                      hintText: "Cari Pertanyaan",
                      hintStyle: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              DefaultTabController(
                  initialIndex: 0,
                  length: 4,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.transparent,
                            labelStyle: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF1D2028)),
                            unselectedLabelStyle: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xFF8D9093)),
                            tabs: [
                              Tab(
                                text: "Muamalah",
                              ),
                              Tab(
                                text: "Akidah",
                              ),
                              Tab(
                                text: "Wanita",
                              ),
                              Tab(
                                text: "Manhaj",
                              ),
                            ]
                        ),
                      ),
                      Container(
                        height: Get.height * 0.52,
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                        child: TabBarView(
                            children: [
                              Container(
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return Container(
                                        padding: EdgeInsets.all(Get.height * 0.02),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Color(0xFFF5EFFB)
                                          )
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                                              style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500, color: Color(0xFF1D2028)),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              "25 Oktober 2021",
                                              style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xFF8D9093)),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.chat_bubble, color: Color(0xFF8D9093),),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        "231",
                                                        style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500, color: Color(0xFF8D9093)),
                                                      )
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.favorite, color: Color(0xFF8D9093),),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        "23",
                                                        style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500, color: Color(0xFF8D9093)),
                                                      )
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return Container(
                                        padding: EdgeInsets.all(Get.height * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xFFF5EFFB)
                                            )
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                                              style: TextStyle(fontSize: 22),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              "25 Oktober 2021",
                                              style: TextStyle(fontSize: 16, color: Color(0xFF8D9093)),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.chat_bubble, color: Colors.grey,),
                                                      SizedBox(width: 5,),
                                                      Text("231", style: TextStyle(color: Colors.grey),)
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.favorite, color: Colors.grey,),
                                                      SizedBox(width: 5,),
                                                      Text("23", style: TextStyle(color: Colors.grey),)
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return Container(
                                        padding: EdgeInsets.all(Get.height * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xFFF5EFFB)
                                            )
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                                              style: TextStyle(fontSize: 22),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              "25 Oktober 2021",
                                              style: TextStyle(fontSize: 16, color: Color(0xFF8D9093)),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.chat_bubble, color: Colors.grey,),
                                                      SizedBox(width: 5,),
                                                      Text("231", style: TextStyle(color: Colors.grey),)
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.favorite, color: Colors.grey,),
                                                      SizedBox(width: 5,),
                                                      Text("23", style: TextStyle(color: Colors.grey),)
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return Container(
                                        padding: EdgeInsets.all(Get.height * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xFFF5EFFB)
                                            )
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                                              style: TextStyle(fontSize: 22),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              "25 Oktober 2021",
                                              style: TextStyle(fontSize: 16, color: Color(0xFF8D9093)),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.chat_bubble, color: Colors.grey,),
                                                      SizedBox(width: 5,),
                                                      Text("231", style: TextStyle(color: Colors.grey),)
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  height: Get.height * 0.04,
                                                  width: Get.height * 0.08,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.favorite, color: Colors.grey,),
                                                      SizedBox(width: 5,),
                                                      Text("23", style: TextStyle(color: Colors.grey),)
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ]
                        ),
                      )
                    ],
                  )
              )
            ],
          )
      ),
      floatingActionButton: Material(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(Get.height * 0.02),
          child: Tombol(
              height: Get.height * 0.09,
              color: Color(0xFF1DAD9B),
              width: Get.width,
              child: Text(
                "Kirim Pertanyaan",
                  style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))
              ),
              onTap: (){}
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// import 'package:amaly/app/custom/CustomAppBar.dart';
// import 'package:amaly/app/custom/Tombol.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../controllers/tanyaustadz_controller.dart';
//
// class TanyaustadzView extends GetView<TanyaustadzController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//             children: [
//               CustomAppBar(msg: "Tanya Ustadz",),
//               Container(
//                 padding: EdgeInsets.all(20),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       fillColor: Colors.grey.withOpacity(0.1),
//                       filled: true,
//                       prefixIcon: Icon(Icons.search, color: Colors.black,),
//                       hintText: "Cari Pertanyaan"
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               DefaultTabController(
//                   initialIndex: 0,
//                   length: 4,
//                   child: Column(
//                     children: [
//                       Container(
//                         child: TabBar(
//                             labelColor: Colors.black,
//                             unselectedLabelColor: Colors.grey,
//                             indicatorColor: Colors.transparent,
//                             tabs: [
//                               Tab(
//                                 text: "Muamalah",
//                               ),
//                               Tab(
//                                 text: "Akidah",
//                               ),
//                               Tab(
//                                 text: "Wanita",
//                               ),
//                               Tab(
//                                 text: "Manhaj",
//                               ),
//                             ]
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(Get.height * 0.02),
//                         child: Tombol(
//                             height: Get.height * 0.09,
//                             color: Color(0xFF1DAD9B),
//                             width: Get.width,
//                             child: Text(
//                               "Kirim Pertanyaan",
//                               style: TextStyle(fontSize: 25),
//                             ),
//                             onTap: (){}
//                         ),
//                       ),
//                     ],
//                   )
//               )
//             ],
//           )
//       ),
//     );
//   }
// }