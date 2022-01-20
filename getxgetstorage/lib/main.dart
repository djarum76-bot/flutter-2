import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxgetstorage/controllers/authC.dart';
import 'package:getxgetstorage/controllers/loginC.dart';
import 'package:getxgetstorage/pages/home.dart';
import 'package:getxgetstorage/pages/login.dart';
import 'package:getxgetstorage/routes/app_page.dart';

void main()async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginC = Get.put(LoginC());
  final authC = Get.put(AuthC());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authC.autoLogin(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Obx((){
              return GetMaterialApp(
                home: authC.isAuth.value ? HomePage() : LoginPage(),
                getPages: AppPage.pages,
              );
            });
          }
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
    );
  }
}