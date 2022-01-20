import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:chatapp/app/utils/error_screen.dart';
import 'package:chatapp/app/utils/loading_screen.dart';
import 'package:chatapp/app/utils/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Obx((){
              return GetMaterialApp(
                title: "Application",
                initialRoute: authC.isSkipIntro.isTrue
                    ? authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN
                    : Routes.INTRODUCTION,
                getPages: AppPages.routes,
              );
            });
          }
          return FutureBuilder(
              future: authC.firstInitialize(),
              builder: (context, snapshot) => SplashScreen()
          );
        }
    );
  }
}
