import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/DetailSuratKeluarModel.dart';
import 'package:logindemo/navbar/home/surat_keluar/SuratKeluarC.dart';
import 'package:logindemo/navbar/navbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailSuratKeluarC extends GetxController{
  final pdfViewerController = PdfViewerController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  final globalC = Get.find<Global>();
  final suratKeluarC = Get.find<SuratKeluarC>();

  getSuratKeluarID()async{
    final response = await dio.get('/api/v1/auth/pengguna/surat/keluar/${Get.arguments[0]}',
        options: Dio.Options(
            headers: {
              "Authorization" : globalC.box.read('token')
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200 && data["status"]){
      globalC.detailSuratKeluar(DetailSuratKeluarModel.fromJson(data));
      globalC.detailSuratKeluar.refresh();
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data = response.data;

      globalC.box.write('token', data["access_token"]);
      getSuratKeluarID();
    }
  }

  setujuSurat(String noSurat)async{
    var params = {
      'no_surat': noSurat,
    };

    final response = await dio.put('/api/v1/auth/pengguna/surat/keluar/approve',
        options: Dio.Options(
            headers: {
              "Authorization" : globalC.box.read('token')
            }
        ),
        data: jsonEncode(params)
    );

    final data = response.data;

    if(response.statusCode == 200 && data["status"]){
      suratKeluarC.getSuratKeluar();
      Get.back();
      // Get.offAll(() => NavBar());
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data = response.data;

      globalC.box.write('token', data["access_token"]);
      setujuSurat(noSurat);
    }
  }
}