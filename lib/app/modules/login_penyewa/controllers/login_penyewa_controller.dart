import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_routes.dart';


class LoginPenyewaController extends GetxController {
  var rememberPassword = false.obs;
  var obscurePassword = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void toggleRememberPassword(bool? value) => rememberPassword.value = value!;
  void toggleObscurePassword() => obscurePassword.toggle();

  void login() {
    print('Login with: ${emailController.text}, ${passwordController.text}');
    // Implement your login logic here
  }

  void navigateToSignUp() {
    Get.toNamed(AppRoutes.SIGNUP);
  }

  void navigateToForgotPassword() {
    Get.toNamed(AppRoutes.RESET_PASSWORD);
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        print('Google Sign-In Successful. User: ${account.displayName}');
        // Implement your Google sign-in logic here
      }
    } catch (error) {
      print('Google Sign-In Failed: $error');
      // Handle error appropriately
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}