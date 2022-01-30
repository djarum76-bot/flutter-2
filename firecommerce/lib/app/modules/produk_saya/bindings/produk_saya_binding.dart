import 'package:get/get.dart';

import '../controllers/produk_saya_controller.dart';

class ProdukSayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdukSayaController>(
      () => ProdukSayaController(),
    );
  }
}
