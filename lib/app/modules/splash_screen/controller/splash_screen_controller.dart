import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.LOGIN_PAGE);
    });
  }
}
