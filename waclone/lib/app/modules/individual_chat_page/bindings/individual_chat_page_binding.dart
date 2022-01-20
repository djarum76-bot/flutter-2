import 'package:get/get.dart';

import '../controllers/individual_chat_page_controller.dart';

class IndividualChatPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<IndividualChatPageController>(
    //   () => IndividualChatPageController(),
    // );
    Get.put(IndividualChatPageController());
  }
}
