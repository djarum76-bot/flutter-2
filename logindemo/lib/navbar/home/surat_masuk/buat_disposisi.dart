import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/surat_masuk/buat_disposisiC.dart';
import 'package:lottie/lottie.dart';
import 'suratMasuk.dart';
import '../disposisi/disposisi.dart';

class CreateDisposisi extends StatelessWidget {

  final createDis = Get.put(CreateDisposisiC());
  final globalC = Get.find<Global>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Buat Disposisi"),
         backgroundColor: Color(0xFF1A237E),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: createDis.getDetailDisposisi(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else{
                return globalC.detailDisposisi.value.data != null
                    ? Column(
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
                              controller: createDis.kepada,
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
                              controller: createDis.no_agenda,
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
                              controller: createDis.pengirim,
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
                              controller: createDis.tglS,
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
                              controller: createDis.perihal,
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
                              controller: createDis.tglD,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                            child: TextFormField(
                              readOnly: globalC.user.value.data!.role == "Satuan Kerja" ? true : false,
                              enabled: globalC.user.value.data!.role == "KAPOLSEK" ? true : false,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Isi Disposisi Kapolsek',
                                  hintText: 'Tuliskan isi disposisi'
                              ),
                              controller: createDis.isi,
                              onSaved: (String? e) => createDis.isi.text = e!,
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
                                createDis.updateIsiSurat();
                              },
                              child: Text(
                                'Buat Disposisi',
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),

                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset("asset/images/404.json")
                        ],
                      );
              }
            }
        ),
      ),
    );
  }
}