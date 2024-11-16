import 'package:get/get.dart';
import '../controllers/password_changed_success_controller.dart';

class PasswordChangedSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordChangedSuccessController>(
          () => PasswordChangedSuccessController(),
    );
  }
}