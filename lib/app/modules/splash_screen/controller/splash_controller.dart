// lib/app/controllers/splash_controller.dart

import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  void _initializeApp() async {
    // Disini bisa ditambahkan inisialisasi yang diperlukan
    // Contoh: cek status login, load initial data, dll
    await Future.delayed(const Duration(seconds: 3));

    // Navigasi ke halaman login
    Get.offAllNamed(AppRoutes.LOGIN_PAGE);
  }
}