import 'package:belajarnode/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getUser(Get.arguments),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return Card(
                    child: Column(
                      children: [
                        Text("${controller.authC.user.value.user![0].id}"),
                        SizedBox(height: 10,),
                        Text("${controller.authC.user.value.user![0].username}"),
                        SizedBox(height: 10,),
                        Text("${controller.authC.user.value.user![0].name}"),
                        SizedBox(height: 10,),
                        Text("${controller.authC.user.value.user![0].lastname}"),
                        SizedBox(height: 10,),
                        Text("${controller.authC.user.value.user![0].mail}"),
                        SizedBox(height: 10,),
                        ElevatedButton(
                            onPressed: (){
                              Get.toNamed(Routes.EDIT_FORM, arguments: controller.authC.user.value.user![0].id);
                            },
                            child: Text("Edit")
                        ),
                        ElevatedButton(
                            onPressed: (){
                              controller.deleteUser(controller.authC.user.value.user![0].id!);
                            },
                            child: Text("Hapus")
                        )
                      ],
                    ),
                  );
                }
              }
          )
      ),
    );
  }
}
