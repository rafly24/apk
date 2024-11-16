import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppController extends GetxController {
  get isLoading => null;

  Future<void> openWhatsAppChat(String phoneNumber) async {
    try {
      // Remove any non-digit characters from the phone number
      phoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]+'), '');

      // Construct the WhatsApp URL
      final whatsappUrl = 'https://wa.me/$phoneNumber';

      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl));
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open WhatsApp',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
