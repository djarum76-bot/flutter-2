import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/DetailSuratKeluarModel.dart';
import 'package:logindemo/navbar/home/surat_keluar/SuratKeluarC.dart';
import 'package:logindemo/navbar/navbar.dart';
import 'package:logindemo/parseHTML.dart';

class CreateRevisiC extends GetxController{

  late TextEditingController tgl;
  late TextEditingController klasifikasi_tujuan;
  late TextEditingController klasifikasi_surat;
  late TextEditingController no;
  late TextEditingController kpd;
  late TextEditingController perihal;
  late TextEditingController isi;

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

      var tglS = DateTime.parse(globalC.detailSuratKeluar.value.data!.tgl.toString());

      print(DateFormat("MMMM","id_ID").format(globalC.detailSuratKeluar.value.data!.tgl!));

      tgl.text = "${tglS.day}-${tglS.month}-${tglS.year}";
      klasifikasi_tujuan.text = globalC.detailSuratKeluar.value.data!.klasifikasiTujuan!;
      klasifikasi_surat.text = globalC.detailSuratKeluar.value.data!.klasifikasiSurat!;
      no.text = globalC.detailSuratKeluar.value.data!.noSurat!;
      kpd.text = globalC.detailSuratKeluar.value.data!.kepada!;
      perihal.text = globalC.detailSuratKeluar.value.data!.perihal!;
      isi.text = parseHtmlString(globalC.detailSuratKeluar.value.data!.isi!);

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

  revisiSurat()async{
    var params = {
      'no_surat': Get.arguments[1],
      'isi_surat': isi.text
    };

    final response = await dio.put('/api/v1/auth/pengguna/surat/keluar/revisi',
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
      int count = 0;
      Get.until((route) => count++ >= 2);
      // Get.offAll(() => NavBar());
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data = response.data;

      globalC.box.write('token', data["access_token"]);
      revisiSurat();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tgl = TextEditingController();
    klasifikasi_tujuan = TextEditingController();
    klasifikasi_surat = TextEditingController();
    no = TextEditingController();
    kpd = TextEditingController();
    perihal = TextEditingController();
    isi = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    tgl.clear();
    klasifikasi_tujuan.clear();
    klasifikasi_surat.clear();
    no.clear();
    kpd.clear();
    perihal.clear();
    isi.clear();
  }
}