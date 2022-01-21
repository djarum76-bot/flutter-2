import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var options = BaseOptions(
  baseUrl: 'http://192.168.100.175:5000',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

final globalkey = GlobalKey<FormState>();

class AuthController extends GetxController{
  final box = GetStorage();
}