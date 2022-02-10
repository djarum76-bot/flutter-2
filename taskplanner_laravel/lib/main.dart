import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/custom/material_color.dart';

import 'app/routes/app_pages.dart';

void main()async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      theme: ThemeData(
          primaryColor: Color(0xffFABB51),
          primarySwatch: createMaterialColor(Color(0xffFABB51)),
          textTheme: GoogleFonts.openSansTextTheme(
              Theme.of(context).textTheme
          )
      ),
      initialRoute: authC.box.read('token') == null ? Routes.LOGIN : Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
