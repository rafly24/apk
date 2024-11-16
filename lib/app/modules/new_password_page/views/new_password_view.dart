import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../login_page/widgets/custom_app_bar.dart';
import '../controllers/new_password_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/password_text_field.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Password',
        showBackButton: true,
        onBack: () => Get.back(), // Panggil Get.back() ketika tombol kembali ditekan
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildPasswordFields(),
                const SizedBox(height: 24),
                _buildResetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create a new password for',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          controller.email,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('New Password'),
        PasswordTextField(
          controller: controller.newPasswordController,
          hintText: 'Enter new password',
          validator: controller.validatePassword,
        ),
        const SizedBox(height: 16),
        const Text('Confirm New Password'),
        PasswordTextField(
          controller: controller.confirmPasswordController,
          hintText: 'Confirm new password',
          validator: controller.validateConfirmPassword,
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return CustomButton(
      text: 'Reset Password',
      onPressed: controller.resetPassword,
    );
  }
}