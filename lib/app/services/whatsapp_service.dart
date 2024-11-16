import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  static Future<void> openWhatsAppChat(String phoneNumber) async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/$phoneNumber');
    
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}