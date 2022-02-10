import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EEDC),
      body: SafeArea(
          child: Column(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Task",
                              style: GoogleFonts.righteous(fontSize: 30),
                            ),
                            Text(
                              "Be Productive Dude",
                              style: GoogleFonts.openSans(fontSize: 20),
                            ),
                            Text(
                              "Today : ${DateFormat('EEE, d MMM yyyy').format(DateTime.now())}",
                              style: GoogleFonts.openSans(fontSize: 20),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Get.toNamed(Routes.ADD_TASK);
                          },
                          child: Text(
                            "Add Task",
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
              SizedBox(height: 10,),
              Expanded(
                  child: Container(
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
                                  ? Center(
                                child: Text(
                                    "Belum ada perencanaan"
                                ),
                              )
                                  : ListView.builder(
                                  itemCount: controller.jumlah.value,
                                  itemBuilder: (context, index){
                                    var data = controller.authC.tasks.value.tasks![index];
                                    return Container(
                                      width: Get.width,
                                      padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                                      margin: EdgeInsets.only(bottom: Get.height * 0.01),
                                      child: ExpansionTileCard(
                                        leading: CircleAvatar(child: Text('${index + 1}')),
                                        title: Text("${DateFormat('EEE, d MMM yyyy').format(controller.tanggal[index])}"),
                                        children: [
                                          Divider(
                                            thickness: 1.0,
                                            height: 1.0,
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemCount: data.task!.length,
                                              itemBuilder: (context, index2){
                                                var data2 = data.task![index2];
                                                return ListTile(
                                                  title: Text("${data2.title}"),
                                                  subtitle: Text(
                                                    "${data2.waktu}",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    softWrap: false,
                                                  ),
                                                  trailing: Icon(Icons.arrow_forward_ios),
                                                  onTap: (){
                                                    Get.toNamed(Routes.DETAIL_TASK, arguments: data2.id);
                                                  },
                                                );
                                              }
                                          )
                                        ],
                                      ),
                                    );
                                  }
                              );
                            });
                          }
                        }
                    ),
                  )
              ),
              SizedBox(height: 10,),
            ],
          )
      ),
    );
  }
}

