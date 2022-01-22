import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: ListView(
        children: [
          Container(
            height: Get.height * 0.24509803921,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: Get.height * 0.61274509803,
            margin: EdgeInsets.symmetric(horizontal: Get.height * 0.01225490196),
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: controller.username,
                  onSaved: (String? e) => controller.username.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: controller.email,
                  onSaved: (String? e) => controller.email.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 10,),
                Obx((){
                  return TextFormField(
                    controller: controller.password,
                    obscureText: controller.obserText.value,
                    onSaved: (String? e) => controller.password.text = e!,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                          controller.obserText.toggle();
                        },
                        child: Icon(
                          controller.obserText.value == true ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  );
                }),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    controller.isMale.toggle();
                  },
                  child: Container(
                    height: Get.height * 0.07352941176,
                    padding: EdgeInsets.only(left: Get.height * 0.01225490196),
                    width: Get.width,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: Row(
                        children: [
                          Obx((){
                            return Text(
                              controller.isMale.value == true ? "Male" : "Female",
                              style: TextStyle(color: Colors.black87, fontSize: 18),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: controller.phone,
                  onSaved: (String? e) => controller.phone.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Phone Number",
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: controller.address,
                  onSaved: (String? e) => controller.address.text = e!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Address",
                  ),
                ),
                SizedBox(height: 10,),
                Obx((){
                  return controller.isLoading.value == false
                      ? Container(
                          height: Get.height * 0.05514705882,
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color(0xff746bc9),
                            onPressed: (){
                              controller.validation();
                            },
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
                Row(
                  children: <Widget>[
                    Text("I Have Already An Account!"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.offNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
