// lib/bindings/whatsapp_binding.dart
import 'package:get/get.dart';

import '../controller/whatsapp_controller.dart';

class WhatsAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WhatsAppController());
  }
}