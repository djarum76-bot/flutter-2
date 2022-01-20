import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waclone/app/material_color.dart';
import 'package:waclone/app/services/services.dart';

import 'app/routes/app_pages.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF075E54)),
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E)
      ),
    );
  }
}
