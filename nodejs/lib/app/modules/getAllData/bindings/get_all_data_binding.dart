import 'package:get/get.dart';

import '../controllers/get_all_data_controller.dart';

class GetAllDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllDataController>(
      () => GetAllDataController(),
    );
  }
}
