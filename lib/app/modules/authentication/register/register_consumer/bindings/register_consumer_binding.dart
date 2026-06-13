import 'package:get/get.dart';

import '../controllers/register_consumer_controller.dart';

class RegisterConsumerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterConsumerController>(
      () => RegisterConsumerController(),
    );
  }
}
