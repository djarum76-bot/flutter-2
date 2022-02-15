import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

import '../controllers/note_controller.dart';

class NoteView extends GetView<NoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EEDC),
      body: SafeArea(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.22,
                decoration: BoxDecoration(
                    color: Color(0xffFABB51),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                ),
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.03, horizontal: Get.height * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new, size: 30,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Note",
                              style: GoogleFonts.righteous(fontSize: 30),
                            ),
                            Text(
                              "Be Sure To Remember It",
                              style: GoogleFonts.openSans(fontSize: 20),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Get.toNamed(Routes.ADD_NOTE);
                          },
                          child: Text(
                            "Add Note",
                            style: GoogleFonts.righteous(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF219F94),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(Get.height * 0.015),
                    child: FutureBuilder(
                        future: controller.getNotes(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState == ConnectionState.done){
                            return Obx((){
                              return controller.jumlahNote.value != 0
                                  ? GridView.builder(
                                        itemCount: controller.jumlahNote.value,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1,
                                          mainAxisSpacing: 20,
                                          crossAxisSpacing: 20,
                                        ),
                                        itemBuilder: (context, index){
                                          return InkWell(
                                            onTap: (){
                                              Get.toNamed(Routes.DETAIL_NOTE, arguments: controller.idNote.value[index]);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFABB51),
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              padding: EdgeInsets.all(Get.height * 0.02),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  "${controller.judulNote.value[index]}",
                                                  style: GoogleFonts.righteous(fontSize: 22, color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                    )
                                  : Center(
                                      child: Text(
                                          "Belum ada catatan"
                                      ),
                                    );
                            });
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
