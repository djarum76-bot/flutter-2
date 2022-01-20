import 'package:belajarnode/app/data/user.dart';
import 'package:belajarnode/app/data/users.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var options = BaseOptions(
  baseUrl: 'http://10.0.2.2:8000',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class AuthController extends GetxController{
  final box = GetStorage();

  final users = UsersModel().obs;
  final user = UserModel().obs;
}