import 'package:bane/app/models/berita_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

var options = BaseOptions(
  baseUrl: 'https://newsapi.org/v2',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

final apiKEY = "54109d3460de4f439c4379f66f2dbc2c";

class NetworkController extends GetxController {
  final berita = BeritaModel().obs;
}
