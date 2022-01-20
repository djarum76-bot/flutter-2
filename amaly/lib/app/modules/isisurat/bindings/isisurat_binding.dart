import 'package:get/get.dart';

import '../controllers/isisurat_controller.dart';

class IsisuratBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsisuratController>(
      () => IsisuratController(),
    );
  }
}
