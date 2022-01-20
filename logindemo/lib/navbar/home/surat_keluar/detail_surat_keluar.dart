import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/surat_keluar/detail_surat_keluarC.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'buat_revisi.dart';
import 'suratKeluar.dart';

class DetailSuratKeluar extends StatelessWidget {

  final detailSK = Get.put(DetailSuratKeluarC());
  final globalC = Get.find<Global>();

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context)
        .size; 
    return Scaffold(
      appBar: AppBar(
         title: Text("Detail Surat Keluar"),
         backgroundColor: Color(0xFF1A237E),
      ),
     body: SingleChildScrollView(
      child: FutureBuilder(
            future: detailSK.getSuratKeluarID(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else{
                var data = globalC.detailSuratKeluar.value.data;
                return Column(
                  children: <Widget>[
                    Container(
                        height: Get.height * 0.055,
                        padding: EdgeInsets.only(top:Get.height * 0.02450980392),
                        child: Center(
                          child: Text(
                            "${data!.perihal}",
                            style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                        )
                    ),
                    DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                                labelColor: Color(0xFF1E3354),
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(width: 4, color: Color(0xFF1A237E))
                                ),
                                tabs: [
                                  Tab(text: "File",),
                                  Tab(text: "Lampiran",),
                                ]
                            ),
                            Container(
                              height: Get.height * 0.685,
                              child: TabBarView(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: Get.height * 0.01225490196),
                                      child: Center(
                                          child: WebView(
                                            initialUrl: 'http://47.254.232.232/outmails-reports/createOutMail/${data.id}',
                                          )
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: Get.height * 0.01225490196),
                                      child: Center(
                                          child: data.lampiran != null && data.lampiran != "-"
                                              ? data.lampiran!.contains('pdf')
                                                ? GestureDetector(
                                                    onDoubleTap: (){
                                                      if(detailSK.pdfViewerController.zoomLevel == 1.0){
                                                        detailSK.pdfViewerController.zoomLevel = 5.0;
                                                      }else{
                                                        detailSK.pdfViewerController.zoomLevel = 1.0;
                                                      }
                                                    },
                                                    child: SfPdfViewer.network(
                                                      "http://47.254.232.232/uploads/surat-keluar/lampiran/${data.lampiran}",
                                                      controller: detailSK.pdfViewerController,
                                                      enableDoubleTapZooming: false,
                                                    ),
                                                  )
                                                : PhotoView(
                                                      imageProvider: NetworkImage(
                                                          "http://47.254.232.232/uploads/surat-keluar/lampiran/${data.lampiran}"
                                                      )
                                                  )
                                              : Center(
                                                  child: Text(
                                                    "Lampiran Tidak Tersedia",
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                )
                                      ),
                                    )
                                  ]
                              ),
                            )
                          ],
                        )
                    ),
                    Get.arguments[1] == "Selesai"
                        ? Container(
                            height: Get.height * 0.09,
                            margin: EdgeInsets.only(top: Get.height * 0.01),
                          )
                        : Container(
                            height: Get.height * 0.09,
                            margin: EdgeInsets.only(top: Get.height * 0.01),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(Get.height * 0.01225490196, 0, Get.height * 0.01225490196, 0),
                                  height: Get.height * 0.0612745098,
                                  width:  size.width *.45,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: FlatButton(
                                    onPressed: () {
                                      Get.to(() => CreateRevisi(), arguments: [data.id, data.noSurat]);
                                    },
                                    child: Text(
                                      'Buat Revisi',
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(Get.height * 0.01225490196, 0, Get.height * 0.01225490196, 0),
                                  height: Get.height * 0.0612745098,
                                  width:  size.width *.45,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: FlatButton(
                                    onPressed: () {
                                      detailSK.setujuSurat(data.noSurat!);
                                    },
                                    child: Text(
                                      'Setuju',
                                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                );
              }
            }
        ),
      ),
    );
  }
}