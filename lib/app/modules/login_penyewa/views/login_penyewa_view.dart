// login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_penyewa_controller.dart';
import '../../../routes/app_routes.dart';
// import 'reset_password_page.dart';

class LoginPenyewa extends StatelessWidget {
  final LoginPenyewaController controller = Get.put(LoginPenyewaController());

  LoginPenyewa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text('Login Penyewa', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.g_mobiledata, color: Colors.green, size: 30),
              label: const Text('Sign in with Google'),
              onPressed: () async {
                await controller.signInWithGoogle();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or', style: TextStyle(color: Colors.grey)),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email, color: Colors.green),
                hintText: 'example123@example.com',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(() => TextField(
                  controller: controller.passwordController,
                  obscureText: controller.obscurePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    hintText: 'x x x x x x x x x x',
                    suffixIcon: IconButton(
                      icon: Icon(controller.obscurePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: controller.toggleObscurePassword,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )),
            Obx(() => Row(
                  children: [
                    Checkbox(
                      value: controller.rememberPassword.value,
                      onChanged: controller.toggleRememberPassword,
                      activeColor: Colors.green,
                    ),
                    const Text('Remember Password'),
                  ],
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  controller.isLoading.value ? null : controller.login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Sign-in')),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                TextButton(
                  child: const Text('Sign up now',
                      style: TextStyle(color: Colors.green)),
                  onPressed: () => Get.toNamed(AppRoutes.SIGNUP),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Center(
                // child: TextButton(
                //   child: Text('Forgot Password?',
                //       style: TextStyle(color: Colors.green)),
                //   onPressed: controller.navigateToForgotPassword,
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
