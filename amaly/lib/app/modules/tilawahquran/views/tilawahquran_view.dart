import 'package:amaly/app/custom/CustomAppBarAlQuran.dart';
import 'package:amaly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tilawahquran_controller.dart';

class TilawahquranView extends GetView<TilawahquranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarAlQuran(
                  msg: "Daftar Qari'"
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Colors.black,),
                    hintText: "Cari Qari'",
                    hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14)
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: Get.height * 0.7,
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.TILAWAHQURANISI);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: Get.height * 0.15,),
                              Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    width: Get.width * 0.6,
                                    child: Text(
                                      "Lorem Ipsum",
                                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFFFFFFF)),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF000000).withOpacity(0.4),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20,),
                                            bottomRight: Radius.circular(20,)
                                        )
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          )
      ),
    );
  }
}
