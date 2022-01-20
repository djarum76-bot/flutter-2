import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/app/service/auth_controller.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'app/routes/app_pages.dart';

void main()async{
  timeago.setLocaleMessages('id', timeago.IdMessages());
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return MaterialApp(
              home: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: TextLiquidFill(
                    text: "Gabut",
                    boxBackgroundColor: Colors.black,
                    boxHeight: Get.height,
                    boxWidth: Get.width,
                    textStyle: GoogleFonts.pacifico(
                      fontSize: 80,
                    ),
                  ),
                ),
              ),
            );
          }else{
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: authC.box.read('token') == null ? Routes.LOGIN : Routes.NAVBAR,
              getPages: AppPages.routes,
            );
          }
        }
    );
  }
}

// class MyApp extends StatelessWidget{
//   final authC = Get.put(AuthController());
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Future.delayed(Duration(seconds: 3)),
//         builder: (context,snapshot){
//           if(snapshot.connectionState == ConnectionState.done){
//             return GetMaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: "Application",
//               initialRoute: authC.box.read('token') == null ? Routes.LOGIN : Routes.NAVBAR,
//               getPages: AppPages.routes,
//             );
//           }
//           return MaterialApp(
//             home: Scaffold(
//               backgroundColor: Colors.white,
//               body: Center(
//                 child: TextLiquidFill(
//                   text: "Gabut",
//                   boxBackgroundColor: Colors.black,
//                   boxHeight: Get.height,
//                   boxWidth: Get.width,
//                   textStyle: GoogleFonts.pacifico(
//                     fontSize: 80,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//     );
//   }
// }

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Application",
//       initialRoute: Routes.EDIT_PROFILE,
//       getPages: AppPages.routes,
//     );
//   }
// }
