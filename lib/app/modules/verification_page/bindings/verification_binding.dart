// lib/app/bindings/whatsapp_binding.dart

import 'package:get/get.dart';

import '../controller/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(() => VerificationController(Get.arguments['email'] ?? ''));
  }
}