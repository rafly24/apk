import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_page_controller.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/help_text.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        onBack: () => Get.back(), // Fungsi untuk tombol kembali
        showBackButton: true, // Menunjukkan bahwa tombol kembali akan ditampilkan
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Radar Kos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Login sebagai',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.green),
                title: const Text('Penyewa'),
                onTap: controller.navigateToLoginPenyewa,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: HelpText(
                onTap: controller.openWhatsAppSupport,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
