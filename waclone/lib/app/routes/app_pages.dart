import 'package:get/get.dart';

import 'package:waclone/app/modules/camera_page/bindings/camera_page_binding.dart';
import 'package:waclone/app/modules/camera_page/views/camera_page_view.dart';
import 'package:waclone/app/modules/camera_view/bindings/camera_view_binding.dart';
import 'package:waclone/app/modules/camera_view/views/camera_view_view.dart';
import 'package:waclone/app/modules/chats_page/bindings/chats_page_binding.dart';
import 'package:waclone/app/modules/chats_page/views/chats_page_view.dart';
import 'package:waclone/app/modules/home/bindings/home_binding.dart';
import 'package:waclone/app/modules/home/views/home_view.dart';
import 'package:waclone/app/modules/individual_chat_page/bindings/individual_chat_page_binding.dart';
import 'package:waclone/app/modules/individual_chat_page/views/individual_chat_page_view.dart';
import 'package:waclone/app/modules/login/bindings/login_binding.dart';
import 'package:waclone/app/modules/login/views/login_view.dart';
import 'package:waclone/app/modules/select_contact/bindings/select_contact_binding.dart';
import 'package:waclone/app/modules/select_contact/views/select_contact_view.dart';

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
      name: _Paths.CHATS_PAGE,
      page: () => ChatsPageView(),
      binding: ChatsPageBinding(),
    ),
    GetPage(
      name: _Paths.INDIVIDUAL_CHAT_PAGE,
      page: () => IndividualChatPageView(),
      binding: IndividualChatPageBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_CONTACT,
      page: () => SelectContactView(),
      binding: SelectContactBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_PAGE,
      page: () => CameraPageView(),
      binding: CameraPageBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_VIEW,
      page: () => CameraViewView(),
      binding: CameraViewBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
