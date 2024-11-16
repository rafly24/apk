// app/controllers/auth_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajement_kost/app/routes/app_routes.dart';


class AuthController extends GetxController {
  final List<TextEditingController> codeControllers =
  List.generate(6, (index) => TextEditingController());

  late final String email;

  void setEmail(String emailAddress) {
    email = emailAddress;
  }

  void verifyCode() {
    String code = codeControllers.map((controller) => controller.text).join();
    if (code.length == 6) {
      // Verification logic here
      Get.offAllNamed(AppRoutes.LOGIN_PAGE);
    } else {
      Get.snackbar('Error', 'Please enter a valid 6-digit code');
    }
  }

  void resendCode() {
    Get.snackbar(
        'Code Resent',
        'A new code has been sent to your email',
        backgroundColor: Colors.green,
        colorText: Colors.white
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