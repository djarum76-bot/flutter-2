import 'package:get/get.dart';

import 'package:firecommerce/app/modules/about/bindings/about_binding.dart';
import 'package:firecommerce/app/modules/about/views/about_view.dart';
import 'package:firecommerce/app/modules/check_out/bindings/check_out_binding.dart';
import 'package:firecommerce/app/modules/check_out/views/check_out_view.dart';
import 'package:firecommerce/app/modules/contact_us/bindings/contact_us_binding.dart';
import 'package:firecommerce/app/modules/contact_us/views/contact_us_view.dart';
import 'package:firecommerce/app/modules/home/bindings/home_binding.dart';
import 'package:firecommerce/app/modules/home/views/home_view.dart';
import 'package:firecommerce/app/modules/login/bindings/login_binding.dart';
import 'package:firecommerce/app/modules/login/views/login_view.dart';
import 'package:firecommerce/app/modules/profile/bindings/profile_binding.dart';
import 'package:firecommerce/app/modules/profile/views/profile_view.dart';
import 'package:firecommerce/app/modules/signup/bindings/signup_binding.dart';
import 'package:firecommerce/app/modules/signup/views/signup_view.dart';

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
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT,
      page: () => CheckOutView(),
      binding: CheckOutBinding(),
    ),
  ];
}
