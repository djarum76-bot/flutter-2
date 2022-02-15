import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EEDC),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getUser(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height * 0.25,
                        decoration: BoxDecoration(
                            color: Color(0xffFABB51),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            )
                        ),
                        padding: EdgeInsets.all(Get.height * 0.03),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 50,
                            ),
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.authC.user.value.user!.username}",
                                      style: GoogleFonts.righteous(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.025, vertical: Get.height * 0.015),
                            child: ListView(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Urgent Task",
                                            style: GoogleFonts.righteous(fontSize: 24),
                                          ),
                                          CircleAvatar(
                                            child: IconButton(
                                                onPressed: (){
                                                  Get.toNamed(Routes.TASK);
                                                },
                                                icon: Icon(Icons.calendar_today)
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        child: FutureBuilder(
                                            future: controller.getTasks(),
                                            builder: (context, snapshot){
                                              if(snapshot.connectionState == ConnectionState.waiting){
                                                return Center(
                                                  child: CircularProgressIndicator(),
                                                );
                                              }else{
                                                return Obx((){
                                                  return controller.jumlah.value == 0
                                                      ? Container(
                                                          width: Get.width,
                                                          height: Get.height * 0.2647,
                                                          child: Center(
                                                            child: Text(
                                                                "Belum ada perencanaan"
                                                            ),
                                                          ),
                                                        )
                                                      : ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: controller.jumlah.value > 3 ? 3 : controller.jumlah.value,
                                                          itemBuilder: (context, index){
                                                            return ListTile(
                                                              onTap: (){
                                                                Get.toNamed(Routes.DETAIL_TASK, arguments: controller.authC.homeTask.value.tasks![index].id);
                                                              },
                                                              title: Text("${controller.judul.value[index]}", style: GoogleFonts.righteous(),),
                                                              subtitle: Text("${DateFormat('EEE, d MMM yyyy').format(controller.tanggal.value[index])} ${controller.waktu.value[index]}"),
                                                              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                                                            );
                                                          }
                                                      );
                                                });
                                              }
                                            }
                                        ),
                                      )
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Important Note",
                                            style: GoogleFonts.righteous(fontSize: 24),
                                          ),
                                          CircleAvatar(
                                            child: IconButton(
                                                onPressed: (){
                                                  Get.toNamed(Routes.NOTE);
                                                },
                                                icon: Icon(Icons.note)
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
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
                                                      shrinkWrap: true,
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
                                              }else{
                                                return Center(
                                                  child: CircularProgressIndicator(),
                                                );
                                              }
                                            }
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
          )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.logout();
          },
          child: Icon(Icons.logout),
      ),
    );
  }
}
