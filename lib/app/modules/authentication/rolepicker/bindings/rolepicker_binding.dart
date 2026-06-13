import 'package:get/get.dart';
import 'package:ladangku/app/modules/authentication/rolepicker/controllers/rolepicker_controller.dart';

class RolepickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RolePickerController>(
      () => RolePickerController(),
    );
  }
}
