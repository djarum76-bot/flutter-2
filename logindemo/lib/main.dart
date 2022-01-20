import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/login.dart';
import 'package:logindemo/navbar/navbar.dart';

void main()async{
  await GetStorage.init();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final globalC = Get.put(Global());

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: globalC.box.read('autologin') != null
          ? globalC.box.read('autologin') ? NavBar() : LoginPage()
          : LoginPage(),
    );
  }
}
