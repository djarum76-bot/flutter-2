import 'package:blog_app/app/data/CommentsModel.dart';
import 'package:blog_app/app/data/PostModel.dart';
import 'package:blog_app/app/data/PostsModel.dart';
import 'package:blog_app/app/data/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var options = BaseOptions(
  baseUrl: 'http://192.168.100.175:8000/api',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class AuthController extends GetxController{
  final box = GetStorage();

  final user = UserModel().obs;

  final posts = PostsModel().obs;

  final post = PostModel().obs;

  final comments = CommentsModel().obs;
}