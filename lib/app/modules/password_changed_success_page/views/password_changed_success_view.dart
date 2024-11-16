import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../new_password_page/widgets/custom_button.dart';
import '../controllers/password_changed_success_controller.dart';

class PasswordChangedSuccessView extends GetView<PasswordChangedSuccessController> {
  const PasswordChangedSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Password Changed Successfully',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _buildSuccessIcon(),
              const SizedBox(height: 24),
              _buildInstructionText(),
              const SizedBox(height: 48),
              CustomButton(
                onPressed: controller.navigateToHome,
                text: 'Back to Home',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  Widget _buildInstructionText() {
    return const Text(
      'If you want to change your password again,\nPlease access the\nProfile > Personal Information > Password',
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}