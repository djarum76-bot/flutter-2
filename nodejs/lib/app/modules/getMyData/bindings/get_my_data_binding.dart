import 'package:get/get.dart';

import '../controllers/get_my_data_controller.dart';

class GetMyDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetMyDataController>(
      () => GetMyDataController(),
    );
  }
}
