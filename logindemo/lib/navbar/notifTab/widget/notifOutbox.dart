import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/navbar/notifTab/model/detail.dart';

class Outbox extends StatelessWidget {

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

class NotifOutbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Outbox(
        
      ),
    );
  }
}

