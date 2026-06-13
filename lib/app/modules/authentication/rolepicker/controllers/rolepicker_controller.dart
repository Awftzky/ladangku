import 'package:get/get.dart';
import 'package:ladangku/app/routes/app_pages.dart'; // Import Routes lu di sini

class RolePickerController extends GetxController {
  final RxString selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  bool get isButtonActive => selectedRole.value.isNotEmpty;

  void goToRegister() {
    if (selectedRole.value == 'farmer') {
      Get.toNamed(Routes.REGISTER_FARMER);
    } else if (selectedRole.value == 'consumer') {
      Get.toNamed(Routes.REGISTER_CONSUMER);
    }
  }
}