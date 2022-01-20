import 'package:get/get.dart';

import '../controllers/detailprogramnominal_controller.dart';

class DetailprogramnominalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailprogramnominalController>(
      () => DetailprogramnominalController(),
    );
  }
}
