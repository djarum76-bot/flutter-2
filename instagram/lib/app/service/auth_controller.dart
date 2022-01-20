import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram/app/data/post_model.dart';
import 'package:instagram/app/data/posts_model.dart';
import 'package:instagram/app/data/stories_model.dart';
import 'package:instagram/app/data/user_model.dart';

var options = BaseOptions(
  baseUrl: 'https://bilz666.000webhostapp.com/api',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class AuthController extends GetxController{
  final box = GetStorage();

  final user = UserModel().obs;

  final posts = PostsModel().obs;

  final post = PostModel().obs;

  final stories = StoriesModel().obs;
}