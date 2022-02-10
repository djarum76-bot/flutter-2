import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskplanner/app/models/home_task_model.dart';
import 'package:taskplanner/app/models/task_model.dart';
import 'package:taskplanner/app/models/tasks_model.dart';
import 'package:taskplanner/app/models/user_model.dart';

var options = BaseOptions(
  baseUrl: 'http://192.168.100.151:8000/api',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

class AuthController extends GetxController {
  final box = GetStorage();

  final user = UserModel().obs;

  final tasks = TasksModel().obs;

  final homeTask = HomeTaskModel().obs;

  final task = TaskModel().obs;
}
