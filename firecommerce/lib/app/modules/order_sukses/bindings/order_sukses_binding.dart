import 'package:get/get.dart';

import '../controllers/order_sukses_controller.dart';

class OrderSuksesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderSuksesController>(
      () => OrderSuksesController(),
    );
  }
}
