import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/settings_controller.dart';
import '../widget/settings_widgets.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller = Get.find();

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          buildNotificationSection(controller),
          const SizedBox(height: 20),
          buildDeleteAccountSection(controller),
        ],
      ),
    );
  }
}