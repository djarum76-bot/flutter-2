import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5EEDC),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getNote(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
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
                                  "Edit Note",
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
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Content"
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  controller: controller.content,
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
                            controller.editNote();
                          },
                          child: Text(
                            "Edit Note",
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
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          )
      ),
    );
  }
}
