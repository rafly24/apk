import 'package:get/get.dart';
import '../../../services/whatsapp_service.dart';
import '../../login_penyewa/views/login_penyewa_view.dart';

class LoginPageController extends GetxController {
  void navigateToLoginPenyewa() {
    Get.to(() => LoginPenyewa());
  }

  void openWhatsAppSupport() {
    const String supportPhoneNumber = '+6282172791631';
    WhatsAppService.openWhatsAppChat(supportPhoneNumber);
  }
}