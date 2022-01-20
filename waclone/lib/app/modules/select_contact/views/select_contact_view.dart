import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waclone/app/routes/app_pages.dart';

import '../controllers/select_contact_controller.dart';

class SelectContactView extends GetView<SelectContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: GoogleFonts.openSans(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
                "100 Contacts",
                style: GoogleFonts.openSans(fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 26,)),
          PopupMenuButton<String>(
              itemBuilder: (context){
                return [
                  PopupMenuItem(child: Text("Invite a friend"), value: "Invite a friend",),
                  PopupMenuItem(child: Text("Contacts"), value: "Contacts",),
                  PopupMenuItem(child: Text("Refresh"), value: "Refresh",),
                  PopupMenuItem(child: Text("Help"), value: "Help",)
                ];
              }
          )
        ],
      ),
      body: ListView.builder(
          itemCount: controller.chats.length,
          itemBuilder: (context, index){
            var data = controller.chats[index];
            return index < 1
                ? Container(
                    child: Column(
                      children: [
                        ListTile(
                          onTap: (){},
                          leading: CircleAvatar(
                            radius: 23,
                            child: Icon(Icons.person_add),
                          ),
                          title: Text(
                              "New Contact",
                              style: GoogleFonts.openSans(fontSize: 15,fontWeight: FontWeight.bold)
                          ),
                        ),
                        ListTile(
                          onTap: (){},
                          leading: CircleAvatar(
                            radius: 23,
                            child: SvgPicture.asset(
                              "asset/person.svg",
                              color: Colors.white,
                              height: Get.height * 0.03676470588,
                              width: Get.height * 0.03676470588,
                            ),
                            backgroundColor: Colors.blueGrey[200],
                          ),
                          title: Text(
                            "${data.name}",
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(
                            "${data.status}",
                            style: GoogleFonts.openSans(
                                fontSize: 13
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : ListTile(
                    onTap: (){},
                    leading: CircleAvatar(
                      radius: 23,
                      child: SvgPicture.asset(
                        "asset/person.svg",
                        color: Colors.white,
                        height: Get.height * 0.03676470588,
                        width: Get.height * 0.03676470588,
                      ),
                      backgroundColor: Colors.blueGrey[200],
                    ),
                    title: Text(
                      "${data.name}",
                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      "${data.status}",
                      style: GoogleFonts.openSans(
                          fontSize: 13
                      ),
                    ),
                  );
          }
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../controllers/select_contact_controller.dart';
//
// class SelectContactView extends GetView<SelectContactController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Select Contact",
//               style: GoogleFonts.openSans(fontSize: 19, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "100 Contacts",
//               style: GoogleFonts.openSans(fontSize: 13),
//             )
//           ],
//         ),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 26,)),
//           PopupMenuButton<String>(
//               itemBuilder: (context){
//                 return [
//                   PopupMenuItem(child: Text("Invite a friend"), value: "Invite a friend",),
//                   PopupMenuItem(child: Text("Contacts"), value: "Contacts",),
//                   PopupMenuItem(child: Text("Refresh"), value: "Refresh",),
//                   PopupMenuItem(child: Text("Help"), value: "Help",)
//                 ];
//               }
//           )
//         ],
//       ),
//       body: ListView.builder(
//           itemCount: controller.chats.length,
//           itemBuilder: (context, index){
//             var data = controller.chats[index];
//             return ListTile(
//               onTap: (){},
//               leading: CircleAvatar(
//                 radius: 23,
//                 child: SvgPicture.asset(
//                   "asset/person.svg",
//                   color: Colors.white,
//                   height: Get.height * 0.03676470588,
//                   width: Get.height * 0.03676470588,
//                 ),
//                 backgroundColor: Colors.blueGrey[200],
//               ),
//               title: Text(
//                 "${data.name}",
//                 style: GoogleFonts.openSans(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold
//                 ),
//               ),
//               subtitle: Text(
//                 "${data.status}",
//                 style: GoogleFonts.openSans(
//                     fontSize: 13
//                 ),
//               ),
//             );
//           }
//       ),
//     );
//   }
// }

