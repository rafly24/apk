import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../login_page/widgets/custom_app_bar.dart';
import '../../personal_info/widgets/custom_text_field.dart';
import '../controllers/reset_password_controller.dart';
import 'package:manajement_kost/app/modules/password_changed_success_page/widgets/custom_button.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Reset Password',
        onBack: () => Get.back(),
        showBackButton: true, // Set to true or false as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter your email to reset your password',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: controller.emailController,
                label: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail, // Pastikan ini valid
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: controller.sendVerificationCode,
                text: 'Send Verification Code',
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
