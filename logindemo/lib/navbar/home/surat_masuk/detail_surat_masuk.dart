import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/navbar/home/surat_masuk/detail_surat_masukC.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'buat_disposisi.dart';
import 'suratMasuk.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


class DetailSuratMasuk extends StatelessWidget {
  final detailSuratMasukC = Get.put(DetailSuratMasukC());

  final globalC = Get.find<Global>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         title: Text("Detail Surat Masuk"),
         backgroundColor: Color(0xFF1A237E),
      ),
      // Text("${listInbox}"),
      body: FutureBuilder(
          future: detailSuratMasukC.getSuratMasukID(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              return Column(
                  children: [
                    Container(
                        height: Get.height * 0.055,
                        padding: EdgeInsets.only(top:Get.height * 0.02450980392),
                        child: Center(
                          child: Text(
                            "${globalC.detailSuratMasuk.value.data!.perihal}",
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
                                          child: GestureDetector(
                                            onDoubleTap: (){
                                              if(detailSuratMasukC.pdfViewerController.zoomLevel == 1.0){
                                                detailSuratMasukC.pdfViewerController.zoomLevel = 5.0;
                                              }else{
                                                detailSuratMasukC.pdfViewerController.zoomLevel = 1.0;
                                              }
                                            },
                                            child: SfPdfViewer.network(
                                              "http://47.254.232.232//uploads/surat-masuk/surat/${globalC.detailSuratMasuk.value.data!.fileSurat}",
                                              controller: detailSuratMasukC.pdfViewerController,
                                              enableDoubleTapZooming: false,
                                            ),
                                          )
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: Get.height * 0.01225490196),
                                      child: Center(
                                          child: globalC.detailSuratMasuk.value.data!.lampiran != null && globalC.detailSuratMasuk.value.data!.lampiran != "-"
                                              ? globalC.detailSuratMasuk.value.data!.lampiran!.contains("pdf")
                                                ? GestureDetector(
                                                    onDoubleTap: (){
                                                      if(detailSuratMasukC.pdfViewerController.zoomLevel == 1.0){
                                                        detailSuratMasukC.pdfViewerController.zoomLevel = 5.0;
                                                      }else{
                                                        detailSuratMasukC.pdfViewerController.zoomLevel = 1.0;
                                                      }
                                                    },
                                                    child: SfPdfViewer.network(
                                                      "http://47.254.232.232/uploads/surat-masuk/lampiran/${globalC.detailSuratMasuk.value.data!.lampiran}",
                                                      controller: detailSuratMasukC.pdfViewerController,
                                                      enableDoubleTapZooming: false,
                                                    ),
                                                  )
                                                : PhotoView(
                                                      imageProvider: NetworkImage("http://47.254.232.232/uploads/surat-masuk/lampiran/${globalC.detailSuratMasuk.value.data!.lampiran}"),
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
                            margin: EdgeInsets.fromLTRB(Get.height * 0.0612745098, Get.height * 0.02, Get.height * 0.0612745098, Get.height * 0.02),
                            height: Get.height * 0.0612745098,
                            width:  Get.width *.45,
                          )
                        : Container(
                            margin: EdgeInsets.fromLTRB(Get.height * 0.0612745098, Get.height * 0.02, Get.height * 0.0612745098, Get.height * 0.02),
                            height: Get.height * 0.0612745098,
                            width:  Get.width *.45,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Get.to(() => CreateDisposisi(), arguments: globalC.detailSuratMasuk.value.data!.noSurat);
                              },
                              child: Text(
                                'Buat Disposisi',
                                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                  ]
              );
            }
          }
      )
    );
  }
}
