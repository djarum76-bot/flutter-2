import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/surat_keluar/buat_revisiC.dart';
import 'suratKeluar.dart';

class CreateRevisi extends StatelessWidget {

  final buatRevisiC = Get.put(CreateRevisiC());
  final globalC = Get.find<Global>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Buat Revisi"),
         backgroundColor: Color(0xFF1A237E),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: buatRevisiC.getSuratKeluarID(),
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
                            labelText: 'Tanggal Surat',
                            border:UnderlineInputBorder()
                        ),
                        controller: buatRevisiC.tgl,
                        onSaved: (String? e) => buatRevisiC.tgl.text = e!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Klasifikasi Tujuan',
                            border:UnderlineInputBorder()
                        ),
                        controller: buatRevisiC.klasifikasi_tujuan,
                        onSaved: (String? e) => buatRevisiC.klasifikasi_tujuan.text = e!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Klasifikasi Surat',
                            border:UnderlineInputBorder()
                        ),
                        controller: buatRevisiC.klasifikasi_surat,
                        onSaved: (String? e) => buatRevisiC.klasifikasi_surat.text = e!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01838235294, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'No Surat',
                            border:UnderlineInputBorder()
                        ),
                        controller: buatRevisiC.no,
                        onSaved: (String? e) => buatRevisiC.no.text = e!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Kepada',
                            border:UnderlineInputBorder()
                        ),
                        controller: buatRevisiC.kpd,
                        onSaved: (String? e) => buatRevisiC.kpd.text = e!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01838235294, bottom: 0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Perihal',
                            border:UnderlineInputBorder()
                        ),
                        controller: buatRevisiC.perihal,
                        onSaved: (String? e) => buatRevisiC.perihal.text = e!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Isi Disposisi Kapolsek',
                            hintText: 'Tuliskan isi disposisi'
                        ),
                        controller: buatRevisiC.isi,
                        onSaved: (String? e) => buatRevisiC.isi.text = e!,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(Get.height * 0.02450980392, Get.height * 0.02450980392, Get.height * 0.02450980392, Get.height * 0.01225490196),
                      height: Get.height * 0.0612745098,
                      width: Get.height * 0.30637254902,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Colors.blue,Colors.indigo[900]!]
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          buatRevisiC.revisiSurat();
                        },
                        child: Text(
                          'Buat Revisi',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
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