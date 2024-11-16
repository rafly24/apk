// lib/app/controllers/whatsapp_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class VerificationController extends GetxController {
  final String email;
  final List<TextEditingController> codeControllers =
  List.generate(6, (index) => TextEditingController());

  VerificationController(this.email);

  void verifyCode() {
    String code = codeControllers.map((controller) => controller.text).join();
    if (code.length == 6) {
      Get.toNamed(AppRoutes.RESET_PASSWORD);
    } else {
      Get.snackbar(
        'Error',
        'Please enter a valid 6-digit code',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void resendCode() {
    Get.snackbar(
      'Code Resent',
      'A new code has been sent to your email',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void onClose() {
    for (var controller in codeControllers) {
      controller.dispose();
    }
    super.onClose();
  }
}