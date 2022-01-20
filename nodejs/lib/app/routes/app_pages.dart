import 'package:get/get.dart';

import 'package:nodejs/app/modules/getAllData/bindings/get_all_data_binding.dart';
import 'package:nodejs/app/modules/getAllData/views/get_all_data_view.dart';
import 'package:nodejs/app/modules/getMyData/bindings/get_my_data_binding.dart';
import 'package:nodejs/app/modules/getMyData/views/get_my_data_view.dart';
import 'package:nodejs/app/modules/home/bindings/home_binding.dart';
import 'package:nodejs/app/modules/home/views/home_view.dart';
import 'package:nodejs/app/modules/login/bindings/login_binding.dart';
import 'package:nodejs/app/modules/login/views/login_view.dart';
import 'package:nodejs/app/modules/register/bindings/register_binding.dart';
import 'package:nodejs/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.GET_ALL_DATA,
      page: () => GetAllDataView(),
      binding: GetAllDataBinding(),
    ),
    GetPage(
      name: _Paths.GET_MY_DATA,
      page: () => GetMyDataView(),
      binding: GetMyDataBinding(),
    ),
  ];
}
