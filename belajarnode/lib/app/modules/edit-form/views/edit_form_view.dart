import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_form_controller.dart';

class EditFormView extends GetView<EditFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditFormView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getUser(Get.arguments),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  return Container(
                    padding: EdgeInsets.all(Get.height * 0.01),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Username"
                          ),
                          controller: controller.username,
                          onSaved: (String? e) => controller.username.text = e!,
                        ),
                        SizedBox(height: 6,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Name"
                          ),
                          controller: controller.name,
                          onSaved: (String? e) => controller.name.text = e!,
                        ),
                        SizedBox(height: 6,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Lastname"
                          ),
                          controller: controller.lastname,
                          onSaved: (String? e) => controller.lastname.text = e!,
                        ),
                        SizedBox(height: 6,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Mail"
                          ),
                          controller: controller.mail,
                          onSaved: (String? e) => controller.mail.text = e!,
                        ),
                        SizedBox(height: 6,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Randomstr"
                          ),
                          controller: controller.randomstr,
                          onSaved: (String? e) => controller.randomstr.text = e!,
                        ),
                        SizedBox(height: 6,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Hash"
                          ),
                          controller: controller.hash,
                          onSaved: (String? e) => controller.hash.text = e!,
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                            onPressed: (){
                              controller.editUser(Get.arguments);
                            },
                            child: Text("Edit")
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
