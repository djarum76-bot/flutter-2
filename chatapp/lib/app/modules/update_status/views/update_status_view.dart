import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.statusC.text = authC.user.value.status!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Status',),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios,)
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller.statusC,
                textInputAction: TextInputAction.done,
                onEditingComplete: (){
                  authC.updateStatus(controller.statusC.text);
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Status",
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 20)
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: Get.width,
                child: ElevatedButton(
                    onPressed: (){
                      authC.updateStatus(controller.statusC.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20)
                    ),
                    child: Text(
                        "Update",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    )
                ),
              )
            ],
          ),
      ),
    );
  }
}
