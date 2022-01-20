import 'package:get/get.dart';

import 'package:blog_app/app/modules/add_post/bindings/add_post_binding.dart';
import 'package:blog_app/app/modules/add_post/views/add_post_view.dart';
import 'package:blog_app/app/modules/comment/bindings/comment_binding.dart';
import 'package:blog_app/app/modules/comment/views/comment_view.dart';
import 'package:blog_app/app/modules/edit_post/bindings/edit_post_binding.dart';
import 'package:blog_app/app/modules/edit_post/views/edit_post_view.dart';
import 'package:blog_app/app/modules/home/bindings/home_binding.dart';
import 'package:blog_app/app/modules/home/views/home_view.dart';
import 'package:blog_app/app/modules/login/bindings/login_binding.dart';
import 'package:blog_app/app/modules/login/views/login_view.dart';
import 'package:blog_app/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:blog_app/app/modules/navbar/views/navbar_view.dart';
import 'package:blog_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:blog_app/app/modules/profile/views/profile_view.dart';
import 'package:blog_app/app/modules/register/bindings/register_binding.dart';
import 'package:blog_app/app/modules/register/views/register_view.dart';

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
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_POST,
      page: () => AddPostView(),
      binding: AddPostBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_POST,
      page: () => EditPostView(),
      binding: EditPostBinding(),
    ),
    GetPage(
      name: _Paths.COMMENT,
      page: () => CommentView(),
      binding: CommentBinding(),
    ),
  ];
}
