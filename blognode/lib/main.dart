import 'package:blognode/app/services/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main()async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme
        )
      ),
      title: "Application",
      initialRoute: authC.box.read('token') == null ? Routes.WELCOME : Routes.NAVBAR,
      getPages: AppPages.routes,
    );
  }
}
