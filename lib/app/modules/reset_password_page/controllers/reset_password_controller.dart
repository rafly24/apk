import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart'; // Pastikan ini mengarah ke file yang benar

class ResetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void sendVerificationCode() {
    if (formKey.currentState!.validate()) {
      // In a real app, you would send the verification code here
      Get.defaultDialog(
        title: 'Verification Code Sent',
        content: Text(
          'We have sent a verification code to ${emailController.text}. Please check your email.',
        ),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
            Get.toNamed(
              AppRoutes.NEW_PASSWORD, // Pastikan ini merujuk ke rute yang benar
              arguments: {'email': emailController.text},
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text('OK'),
        ),
      );
    }
  }
}
