import 'package:get/get.dart';
import 'package:resep/app/modules/home/controllers/home_controller.dart';
import 'package:resep/app/modules/search/controllers/search_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<SearchController>(
          () => SearchController(),
    );
  }
}
