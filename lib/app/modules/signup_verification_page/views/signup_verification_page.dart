// app/modules/auth/views/signup_verification_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/verification_code_field.dart';

class SignUpVerificationPage extends GetView<AuthController> {
  final String email;

  const SignUpVerificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    controller.setEmail(email);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildVerificationFields(context), // Pastikan metode ini ada
            const SizedBox(height: 32),
            _buildVerifyButton(),
            const SizedBox(height: 16),
            _buildResendButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      title: const Text('Verify Email', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify Your Email',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        const SizedBox(height: 8),
        const Text(
          'Enter the 6-digit code sent to',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          email,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildVerificationFields(BuildContext context) {
    return const Column(
      children: [
        VerificationCodeField(), // Widget untuk kode verifikasi
        // Tambahan lainnya jika perlu
      ],
    );
  }

  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.verifyCode,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Verify', style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _buildResendButton() {
    return Center(
      child: TextButton(
        onPressed: controller.resendCode,
        child: const Text(
          'Resend Code',
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
      ),
    );
  }
}
