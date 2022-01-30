import 'package:get/get.dart';

import '../controllers/registrasi_toko_controller.dart';

class RegistrasiTokoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrasiTokoController>(
      () => RegistrasiTokoController(),
    );
  }
}
