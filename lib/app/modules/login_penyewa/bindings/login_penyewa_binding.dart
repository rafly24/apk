import 'package:get/get.dart';
import '../controller/login_penyewa_controller.dart';

class LoginPenyewaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPenyewaController>(() => LoginPenyewaController());
  }
}