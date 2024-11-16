import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_page_controller.dart';

class LoginPageView extends StatelessWidget {
  final LoginPageController controller = Get.find<LoginPageController>();

  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildLoginCard(),
          const SizedBox(height: 24),
          _buildHelpSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
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
      ],
    );
  }

  Widget _buildLoginCard() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.info_outline, color: Colors.green),
        title: const Text('Penyewa'),
        onTap: controller.navigateToLoginPenyewa,
      ),
    );
  }

  Widget _buildHelpSection() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            const TextSpan(text: 'Need Help? '),
            WidgetSpan(
              child: GestureDetector(
                onTap: controller.openWhatsAppSupport,
                child: const Text(
                  'Click Here',
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}