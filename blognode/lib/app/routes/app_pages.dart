import 'package:get/get.dart';

import 'package:blognode/app/modules/home/bindings/home_binding.dart';
import 'package:blognode/app/modules/home/views/home_view.dart';
import 'package:blognode/app/modules/signup/bindings/signup_binding.dart';
import 'package:blognode/app/modules/signup/views/signup_view.dart';
import 'package:blognode/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:blognode/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
