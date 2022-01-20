import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logindemo/model/DetailDisposisi.dart';
import 'package:logindemo/model/DetailSuratKeluarModel.dart';
import 'package:logindemo/model/DetailSuratMasukModel.dart';
import 'package:logindemo/model/DisposisiModel.dart';
import 'package:logindemo/model/NotifikasiModel.dart';
import 'package:logindemo/model/SuratKeluarModel.dart';
import 'package:logindemo/model/SuratMasukModel.dart';
import 'package:logindemo/model/user_model.dart';

var options = BaseOptions(
  baseUrl: 'http://e-polsek.azuhri-dev.com/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);


class Global extends GetxController{
  final box = GetStorage();

  final user = UserModel().obs;

  final suratMasuk = SuratMasukModel().obs;

  final detailSuratMasuk = DetailSuratMasukModel().obs;

  final detailDisposisi = DetailDisposisiModel().obs;

  final disposisi = DisposisiModel().obs;

  final suratKeluar = SuratKeluarModel().obs;

  final detailSuratKeluar = DetailSuratKeluarModel().obs;

  final notifikasi = NotifikasiModel().obs;
}