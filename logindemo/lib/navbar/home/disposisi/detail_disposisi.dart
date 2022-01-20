import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/disposisi/detail_disposisiC.dart';

class DetailDisposisi extends StatelessWidget {

  final detailDis = Get.put(DetailDisposisiC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
         title: Text("Detail Disposisi"),
         backgroundColor: Color(0xFF1A237E),
      ),
       body: SingleChildScrollView(
        child: FutureBuilder(
            future: detailDis.getDetailDisposisi(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else{
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Kepada',
                            border:UnderlineInputBorder()
                        ),
                        controller: detailDis.kepada,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Nomor Agenda',
                            border:UnderlineInputBorder()
                        ),
                        controller: detailDis.no_agenda,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Pengirim',
                            border:UnderlineInputBorder()
                        ),
                        controller: detailDis.pengirim,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01838235294, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Tanggal Surat',
                            border:UnderlineInputBorder()
                        ),
                        controller: detailDis.tglS,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Perihal',
                            border:UnderlineInputBorder()
                        ),
                        controller: detailDis.perihal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01838235294, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Tanggal Diterima',
                            border:UnderlineInputBorder()
                        ),
                        controller: detailDis.tglD,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Isi Disposisi Kapolsek',
                            hintText: 'Tuliskan isi disposisi'
                        ),
                        controller: detailDis.isi,
                      ),
                    ),
                  ],
                );
              }
            }
        ),
      ),
    );
  }
}