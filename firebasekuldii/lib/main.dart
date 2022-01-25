import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasekuldii/app/controllers/auth_controller.dart';
import 'package:firebasekuldii/app/modules/home/controllers/home_controller.dart';
import 'package:firebasekuldii/app/modules/home/views/home_view.dart';
import 'package:firebasekuldii/app/modules/login/controllers/login_controller.dart';
import 'package:firebasekuldii/app/modules/login/views/login_view.dart';
import 'package:firebasekuldii/app/utils/loading_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: "Application",
    //   initialRoute: Routes.QUERY,
    //   getPages: AppPages.routes,
    // );

    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          print(snapshot);
          return GetMaterialApp(
            title: "Application",
            initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true ? Routes.HOME : Routes.LOGIN,
            // home: snapshot.data == null ? LoginView() : HomeView(),
            getPages: AppPages.routes,
          );
        }
        return LoadingView();
      }
    );

    // return GetMaterialApp(
    //   title: "Application",
    //   initialRoute: Routes.HOME_STORAGE,
    //   getPages: AppPages.routes,
    // );
  }
}
