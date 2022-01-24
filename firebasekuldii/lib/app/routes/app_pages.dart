import 'package:get/get.dart';

import 'package:firebasekuldii/app/modules/add_product/bindings/add_product_binding.dart';
import 'package:firebasekuldii/app/modules/add_product/views/add_product_view.dart';
import 'package:firebasekuldii/app/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:firebasekuldii/app/modules/edit_product/views/edit_product_view.dart';
import 'package:firebasekuldii/app/modules/home/bindings/home_binding.dart';
import 'package:firebasekuldii/app/modules/home/views/home_view.dart';
import 'package:firebasekuldii/app/modules/home_storage/bindings/home_storage_binding.dart';
import 'package:firebasekuldii/app/modules/home_storage/views/home_storage_view.dart';
import 'package:firebasekuldii/app/modules/login/bindings/login_binding.dart';
import 'package:firebasekuldii/app/modules/login/views/login_view.dart';
import 'package:firebasekuldii/app/modules/query/bindings/query_binding.dart';
import 'package:firebasekuldii/app/modules/query/views/query_view.dart';
import 'package:firebasekuldii/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:firebasekuldii/app/modules/reset_password/views/reset_password_view.dart';
import 'package:firebasekuldii/app/modules/signup/bindings/signup_binding.dart';
import 'package:firebasekuldii/app/modules/signup/views/signup_view.dart';

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
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.QUERY,
      page: () => QueryView(),
      binding: QueryBinding(),
    ),
    GetPage(
      name: _Paths.HOME_STORAGE,
      page: () => HomeStorageView(),
      binding: HomeStorageBinding(),
    ),
  ];
}
