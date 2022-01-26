import 'package:bane/app/controllers/network_controller.dart';
import 'package:bane/app/modules/home/controllers/home_controller.dart';
import 'package:bane/app/modules/profile/controllers/profile_controller.dart';
import 'package:bane/app/modules/search/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<SearchController>(
          () => SearchController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
    Get.lazyPut<NetworkController>(
          () => NetworkController(),
    );
  }
}
