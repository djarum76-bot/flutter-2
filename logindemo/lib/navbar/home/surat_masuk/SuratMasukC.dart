import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/SuratMasukModel.dart';

class SuratMasukC extends GetxController{
  final globalC = Get.find<Global>();

  final filter = "Hapus".obs;

  List<String> bulan = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mai",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
    "Hapus"
  ];

  getSuratMasuk()async{
    final response = await dio.get('/api/v1/auth/pengguna/surat/masuk',
        options: Dio.Options(
            headers: {
              "Authorization" : globalC.box.read('token')
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200 && data["status"]){
      globalC.suratMasuk(SuratMasukModel.fromJson(data));
      globalC.suratMasuk.refresh();
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':globalC.box.read('username'),
        'password':globalC.box.read('password')
      });

      final response = await dio.post('/api/v1/auth/login',data: formData);

      final data1 = response.data;

      globalC.box.write('token', data1["access_token"]);
      getSuratMasuk();
    }
  }
}