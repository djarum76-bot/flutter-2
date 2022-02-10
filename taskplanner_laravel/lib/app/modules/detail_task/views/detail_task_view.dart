import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

import '../controllers/detail_task_controller.dart';

class DetailTaskView extends GetView<DetailTaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EEDC),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getTask(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  var data = controller.authC.task.value.task![0];
                  return Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height * 0.25,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data.title}",
                                  style: GoogleFonts.righteous(fontSize: 30),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${DateFormat('EEE, d MMM yyyy').format(data.tanggal!)}",
                                      style: GoogleFonts.openSans(fontSize: 20),
                                    ),
                                    Text(
                                      "${data.waktu}",
                                      style: GoogleFonts.openSans(fontSize: 20),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.all(Get.height * 0.015),
                            child: ListView(
                              children: [
                                Text(
                                  "Description",
                                  style: GoogleFonts.righteous(fontSize: 30),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "${data.deskripsi}",
                                  style: GoogleFonts.openSans(fontSize: 20),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          )
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.01, horizontal: Get.height * 0.015),
                        width: Get.width,
                        height: Get.height * 0.07,
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                  onPressed: (){
                                    controller.deleteTask();
                                  },
                                  child: Text(
                                    "Delete Task",
                                    style: GoogleFonts.righteous(color: Colors.white, fontSize: 20),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFFFC4F4F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )
                                  ),
                                )
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                                child: ElevatedButton(
                                  onPressed: (){
                                    Get.toNamed(Routes.EDIT_TASK, arguments: data.id);
                                  },
                                  child: Text(
                                    "Edit Task",
                                    style: GoogleFonts.righteous(color: Colors.white, fontSize: 20),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF219F94),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )
                                  ),
                                )
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
