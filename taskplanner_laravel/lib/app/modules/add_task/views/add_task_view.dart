import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taskplanner/app/custom/simply_format.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5EEDC),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.03, horizontal: Get.height * 0.015),
                child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new, size: 30,),
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Get.height * 0.015,vertical: Get.height * 0.01),
                    child: ListView(
                      children: [
                        Text(
                          "Create New Task",
                          style: GoogleFonts.righteous(fontSize: 40),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Title"
                          ),
                          controller: controller.title,
                        ),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Obx((){
                                  return controller.tgl.value == ""
                                      ? TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Isi Tanggal Terlebih dahulu"
                                          ),
                                          readOnly: true,
                                        )
                                      : TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "${DateFormat('EEE, d MMM yyyy').format(controller.selectedDate.value)}"
                                          ),
                                          readOnly: true,
                                        );
                                })
                            ),
                            CircleAvatar(
                              child: IconButton(
                                  onPressed: ()async{
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: controller.selectedDate.value,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2025),
                                    );

                                    if(picked != null && picked != controller.selectedDate.value){
                                      controller.selectedDate.value = picked;
                                      controller.tgl.value = simplyFormat(time: controller.selectedDate.value);
                                      print(controller.tgl.value);
                                      // controller.tgl.value = DateFormat('EEE, d MMM yyyy').format(controller.selectedDate.value);
                                    }
                                  },
                                  icon: Icon(Icons.calendar_today, color: Colors.white,)
                              ),
                              backgroundColor: Color(0xFF219F94),
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Obx((){
                                  return controller.waktu.value == ""
                                      ? TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Isi Jam Terlebih dahulu"
                                          ),
                                          readOnly: true,
                                        )
                                      : TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "${controller.selectedTime.value.format(context)}"
                                          ),
                                          readOnly: true,
                                        );
                                })
                            ),
                            CircleAvatar(
                              child: IconButton(
                                  onPressed: (){
                                    Navigator.of(context).push(
                                      showPicker(
                                        context: context,
                                        value: controller.selectedTime.value,
                                        onChange: (TimeOfDay newTime)async{
                                          controller.selectedTime.value = newTime;
                                          controller.selectedDateAndTime.value = await controller.selectedDate.value.add(Duration(
                                            hours: controller.selectedTime.value.hour,
                                            minutes: controller.selectedTime.value.minute
                                          ));
                                          controller.waktu.value = "${controller.selectedTime.value.format(context)}";
                                          print(controller.waktu.value);
                                          // controller.waktu.value = controller.selectedTime.value.format(context);
                                        },
                                        minuteInterval: MinuteInterval.FIVE,
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.timelapse_rounded, color: Colors.white,)
                              ),
                              backgroundColor: Color(0xFF219F94),
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Description"
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          controller: controller.desc,
                        )
                      ],
                    ),
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01, horizontal: Get.height * 0.015),
                width: Get.width,
                height: Get.height * 0.07,
                child: ElevatedButton(
                  onPressed: (){
                    controller.addTask();
                  },
                  child: Text(
                    "Add Task",
                    style: GoogleFonts.righteous(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF219F94),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
