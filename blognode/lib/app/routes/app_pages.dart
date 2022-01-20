import 'package:get/get.dart';

import 'package:blognode/app/modules/add_blog/bindings/add_blog_binding.dart';
import 'package:blognode/app/modules/add_blog/views/add_blog_view.dart';
import 'package:blognode/app/modules/create_profile/bindings/create_profile_binding.dart';
import 'package:blognode/app/modules/create_profile/views/create_profile_view.dart';
import 'package:blognode/app/modules/forgotpassword/bindings/forgotpassword_binding.dart';
import 'package:blognode/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:blognode/app/modules/home/bindings/home_binding.dart';
import 'package:blognode/app/modules/home/views/home_view.dart';
import 'package:blognode/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:blognode/app/modules/navbar/views/navbar_view.dart';
import 'package:blognode/app/modules/profile/bindings/profile_binding.dart';
import 'package:blognode/app/modules/profile/views/profile_view.dart';
import 'package:blognode/app/modules/signin/bindings/signin_binding.dart';
import 'package:blognode/app/modules/signin/views/signin_view.dart';
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
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BLOG,
      page: () => AddBlogView(),
      binding: AddBlogBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PROFILE,
      page: () => CreateProfileView(),
      binding: CreateProfileBinding(),
    ),
  ];
}
