import 'package:get/get.dart';

import 'package:bane/app/modules/detail/bindings/detail_binding.dart';
import 'package:bane/app/modules/detail/views/detail_view.dart';
import 'package:bane/app/modules/home/bindings/home_binding.dart';
import 'package:bane/app/modules/home/views/home_view.dart';
import 'package:bane/app/modules/login/bindings/login_binding.dart';
import 'package:bane/app/modules/login/views/login_view.dart';
import 'package:bane/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:bane/app/modules/navbar/views/navbar_view.dart';
import 'package:bane/app/modules/profile/bindings/profile_binding.dart';
import 'package:bane/app/modules/profile/views/profile_view.dart';
import 'package:bane/app/modules/register/bindings/register_binding.dart';
import 'package:bane/app/modules/register/views/register_view.dart';
import 'package:bane/app/modules/search/bindings/search_binding.dart';
import 'package:bane/app/modules/search/views/search_view.dart';

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
      name: _Paths.NAVBAR,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
