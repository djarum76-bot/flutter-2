import 'package:amaly/app/custom/material_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.DAFTARSURAT,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF1DAD9B))
      ),
    ),
  );
}
