import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/DetailDisposisi.dart';

class DetailDisposisiC extends GetxController{
  late TextEditingController kepada;
  late TextEditingController no_agenda;
  late TextEditingController pengirim;
  late TextEditingController tglS;
  late TextEditingController tglD;
  late TextEditingController perihal;
  late TextEditingController isi;

  final globalC = Get.find<Global>();

  getDetailDisposisi()async{
    Dio.FormData noSurat = Dio.FormData.fromMap({
      'no_surat': Get.arguments
    });

    final response = await dio.post('/api/v1/auth/pengguna/surat/disposisi/detail',
        options: Dio.Options(
            headers: {
              "Authorization" : globalC.box.read('token')
            }
        ),
        data: noSurat
    );

    final data = response.data;

    if(response.statusCode == 200 && data["status"]){
      globalC.detailDisposisi(DetailDisposisiModel.fromJson(data));
      globalC.detailDisposisi.refresh();

      var tglSM = DateTime.parse(globalC.detailDisposisi.value.data!.tglSurat!.toString());
      var tglDM = DateTime.parse(globalC.detailDisposisi.value.data!.tglDiterima!.toString());

      kepada.text = globalC.detailDisposisi.value.data!.kepada!;
      no_agenda.text = globalC.detailDisposisi.value.data!.noAgenda!;
      pengirim.text = globalC.detailDisposisi.value.data!.pengirim!;
      tglS.text = "${tglSM.day}-${tglSM.month}-${tglSM.year}";
      tglD.text = "${tglDM.day}-${tglDM.month}-${tglDM.year}";
      perihal.text = globalC.detailDisposisi.value.data!.perihal!;
      isi.text = globalC.detailDisposisi.value.data!.isi! == null ? "" : globalC.detailDisposisi.value.data!.isi!;

    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data = response.data;

      globalC.box.write('token', data["access_token"]);
      getDetailDisposisi();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    kepada = TextEditingController();
    no_agenda = TextEditingController();
    pengirim = TextEditingController();
    tglS = TextEditingController();
    tglD = TextEditingController();
    perihal = TextEditingController();
    isi = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    kepada.clear();
    no_agenda.clear();
    pengirim.clear();
    tglS.clear();
    tglD.clear();
    perihal.clear();
    isi.clear();
  }
}