import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/navbar/notifTab/model/detail.dart';

class Inbox extends StatelessWidget {

  List<Detail> details = [
    Detail(title: 'Surat Tugas Desa Sumberrejo', user: 'Zainul Abidin', status: "Done"),
    Detail(title: 'Rapat Calon Perangkat Desa Tlogorejo', user: 'Teguh Bayu Prayogo', status: "Pending"),
    Detail(title: 'Pelantikan Perangkat Desa Tlogorejo', user: 'Budi Iswanto', status: "Done"),
    Detail(title: 'Surat Tugas Desa Sumberrejo', user: 'Djuarto.S', status: "Done"),
    Detail(title: 'Surat Persetujuan Acara', user: 'M.Edi Purwanto', status: "Pending"),
    Detail(title: 'Pelantikan Perangkat Desa Rungkut', user: 'Budi Iswanto', status: "Done"),

  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(Get.height * 0.01225490196, Get.height * 0.01225490196, Get.height * 0.01225490196, Get.height * 0.01225490196),
        child: ListView.builder(
            itemBuilder: (context, index){
              return DetailCard(details[index]);
            },
            itemCount: details.length,
        ),
      ),
    );
  }

  Widget DetailCard(Detail detail) {
    return Padding(
      padding: EdgeInsets.all(Get.height * 0.00122549019),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(Get.height * 0.03676470588, Get.height * 0.01838235294, Get.height * 0.01715686274, Get.height * 0.01225490196),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(detail.title,
                    style: TextStyle (
                        color: Colors.black,
                        fontSize: 16
                    ),
                  ),
                  Text(detail.user,
                    style: TextStyle (
                        color: Colors.black,
                        fontSize: 13,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(detail.status,
                    style: TextStyle (
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotifInbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inbox(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:logindemo/notifTab/detail.dart';
//
// class Inbox extends StatefulWidget {
//   @override
//   _InboxState createState() => _InboxState();
// }
//
// class _InboxState extends State<Inbox> {
//
//   List<Detail> details = [
//     Detail(title: 'Surat Tugas Desa Sumberrejo', user: 'Zainul Abidin', status: "Done"),
//     Detail(title: 'Rapat Calon Perangkat Desa Tlogorejo', user: 'Teguh Bayu Prayogo', status: "Pending"),
//     Detail(title: 'Pelantikan Perangkat Desa Tlogorejo', user: 'Budi Iswanto', status: "Done"),
//     Detail(title: 'Surat Tugas Desa Sumberrejo', user: 'Djuarto.S', status: "Done"),
//     Detail(title: 'Surat Persetujuan Acara', user: 'M.Edi Purwanto', status: "Pending"),
//     Detail(title: 'Pelantikan Perangkat Desa Rungkut', user: 'Budi Iswanto', status: "Done"),
//
//   ];
//   Widget DetailCard(Detail) {
//     return Padding(
//       padding: EdgeInsets.all(1.0),
//       child: Card(
//         color: Colors.white,
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(30, 15, 14, 10),
//           child: Row(
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(Detail.title,
//                     style: TextStyle (
//                         color: Colors.black,
//                         fontSize: 16
//                     ),
//                   ),
//                   Text(Detail.user,
//                     style: TextStyle (
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontStyle: FontStyle.italic
//                     ),
//                   ),
//                   Text(Detail.status,
//                     style: TextStyle (
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//         child: Column(
//             children:details.map((p) {
//               return DetailCard(p);
//             }).toList()
//         ),
//       ),
//     );
//   }
// }
//
// class NotifInbox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Inbox(
//
//       ),
//     );
//   }
// }
//
