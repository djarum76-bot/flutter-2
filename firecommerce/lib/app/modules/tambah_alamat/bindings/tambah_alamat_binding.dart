import 'package:get/get.dart';

import '../controllers/tambah_alamat_controller.dart';

class TambahAlamatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahAlamatController>(
      () => TambahAlamatController(),
    );
  }
}
