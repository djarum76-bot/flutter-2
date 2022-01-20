import 'package:get/get.dart';

import 'package:instagram/app/modules/add/bindings/add_binding.dart';
import 'package:instagram/app/modules/add/views/add_view.dart';
import 'package:instagram/app/modules/add_story/bindings/add_story_binding.dart';
import 'package:instagram/app/modules/add_story/views/add_story_view.dart';
import 'package:instagram/app/modules/ditandai/bindings/ditandai_binding.dart';
import 'package:instagram/app/modules/ditandai/views/ditandai_view.dart';
import 'package:instagram/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:instagram/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:instagram/app/modules/home/bindings/home_binding.dart';
import 'package:instagram/app/modules/home/views/home_view.dart';
import 'package:instagram/app/modules/komen/bindings/komen_binding.dart';
import 'package:instagram/app/modules/komen/views/komen_view.dart';
import 'package:instagram/app/modules/login/bindings/login_binding.dart';
import 'package:instagram/app/modules/login/views/login_view.dart';
import 'package:instagram/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:instagram/app/modules/navbar/views/navbar_view.dart';
import 'package:instagram/app/modules/pesan/bindings/pesan_binding.dart';
import 'package:instagram/app/modules/pesan/views/pesan_view.dart';
import 'package:instagram/app/modules/postingan/bindings/postingan_binding.dart';
import 'package:instagram/app/modules/postingan/views/postingan_view.dart';
import 'package:instagram/app/modules/profile/bindings/profile_binding.dart';
import 'package:instagram/app/modules/profile/views/profile_view.dart';
import 'package:instagram/app/modules/register/bindings/register_binding.dart';
import 'package:instagram/app/modules/register/views/register_view.dart';
import 'package:instagram/app/modules/story/bindings/story_binding.dart';
import 'package:instagram/app/modules/story/views/story_view.dart';

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
      name: _Paths.NAVBAR,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.POSTINGAN,
      page: () => PostinganView(),
      binding: PostinganBinding(),
    ),
    GetPage(
      name: _Paths.DITANDAI,
      page: () => DitandaiView(),
      binding: DitandaiBinding(),
    ),
    GetPage(
      name: _Paths.PESAN,
      page: () => PesanView(),
      binding: PesanBinding(),
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
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.KOMEN,
      page: () => KomenView(),
      binding: KomenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STORY,
      page: () => AddStoryView(),
      binding: AddStoryBinding(),
    ),
    GetPage(
      name: _Paths.STORY,
      page: () => StoryView(),
      binding: StoryBinding(),
    ),
  ];
}
