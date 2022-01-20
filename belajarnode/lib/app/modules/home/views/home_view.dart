import 'package:belajarnode/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getAllUser(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return ListView.builder(
                      itemCount: controller.authC.users.value.users!.length,
                      itemBuilder: (context, index){
                        var data = controller.authC.users.value.users![index];
                        return Card(
                          child: ListTile(
                            onTap: (){
                              Get.toNamed(Routes.DETAIL, arguments: data.id);
                            },
                            title: Text("${data.username}"),
                            subtitle: Text("${data.mail}"),
                          ),
                        );
                      }
                  );
                }
              }
          )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(Routes.FORM);
          }
      ),
    );
  }
}
