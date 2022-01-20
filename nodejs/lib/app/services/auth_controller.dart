import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var options = BaseOptions(
  baseUrl: 'http://10.0.2.2:3000/auth/api/v1',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class AuthController extends GetxController{
  final box = GetStorage();
}