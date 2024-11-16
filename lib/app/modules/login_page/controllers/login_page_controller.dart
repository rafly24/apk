import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../services/whatsapp_service.dart';

class LoginPageController extends GetxController {
  void navigateToLoginPenyewa() {
    print("Navigasi ke halaman LOGIN_PENYEWA"); // Tambahkan ini
    Get.toNamed(AppRoutes.LOGIN_PENYEWA);
  }


  void openWhatsAppSupport() {
    const String supportPhoneNumber = '+6282172791631';
    WhatsAppService.openWhatsAppChat(supportPhoneNumber);
  }
}