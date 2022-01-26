import 'package:bane/app/controllers/auth_controller_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.authStatus(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            return GetMaterialApp(
              title: "Application",
              initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true ? Routes.NAVBAR : Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}