import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/DetailSuratMasukModel.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailSuratMasukC extends GetxController{

  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  final globalC = Get.find<Global>();
  final pdfViewerController = PdfViewerController();

  getSuratMasukID()async{
    final response = await dio.get('/api/v1/auth/pengguna/surat/masuk/${Get.arguments[0]}',
        options: Dio.Options(
            headers: {
              "Authorization" : globalC.box.read('token')
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200 && data["status"]){
      globalC.detailSuratMasuk(DetailSuratMasukModel.fromJson(data));
      globalC.detailSuratMasuk.refresh();
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data = response.data;

      globalC.box.write('token', data["access_token"]);
      getSuratMasukID();
    }
  }
}