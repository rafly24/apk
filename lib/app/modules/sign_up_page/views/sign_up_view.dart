import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../../new_password_page/widgets/custom_button.dart';
import '../../reset_password_page/widgets/custom_app_bar.dart';
import '../controllers/sign_up_controller.dart';
import '../widgets/avatar_icon.dart';
import '../widgets/custom_text_field.dart'; // Pastikan ini diimpor

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign up Account',
        onBack: () => Get.back(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: AvatarIcon(
                  icon: Icons.person_add,
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              _buildInputFields(),
              const SizedBox(height: 24),
              _buildSignUpButton(),
              const SizedBox(height: 16),
              _buildLoginLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: 'Full Name',
          controller: controller.nameController,
          hintText: 'Type your name',
          validator: controller.validateName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Phone Number',
          controller: controller.phoneController,
          hintText: 'Type your phone number',
          keyboardType: TextInputType.phone,
          validator: controller.validatePhone,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Email',
          controller: controller.emailController,
          hintText: 'Type your email',
          keyboardType: TextInputType.emailAddress,
          validator: controller.validateEmail,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Create a password',
          controller: controller.passwordController,
          hintText: 'Choose a password',
          obscureText: true,
          validator: controller.validatePassword,
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return CustomButton(
      onPressed: controller.signUp,
      text: 'Sign up',
      width: double.infinity,
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            const TextSpan(text: 'Already have an account? '),
            TextSpan(
              text: 'Sign in now',
              style: const TextStyle(color: Colors.green),
              recognizer: TapGestureRecognizer()
                ..onTap = controller.navigateToLogin as GestureTapCallback?,
            ),
          ],
        ),
      ),
    );
  }
}
