import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Form(
        key: controller.formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          Text(
                            "Login",
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.email,
                            onSaved: (String? e) => controller.email.text = e!,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Email",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                          SizedBox(
                            height: 10,
                          ),
                          Obx((){
                            return controller.isLoading.value == false
                                ? Container(
                                    height: Get.height * 0.05514705882,
                                    width: double.infinity,
                                    child: RaisedButton(
                                      child: Text(
                                        "Login",
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text("I Dont Have Account!"),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.offNamed(Routes.SIGNUP);
                                },
                                child: Text(
                                  "SignUp",
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
