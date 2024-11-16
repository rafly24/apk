// lib/views/whatsapp_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/whatsapp_controller.dart';
import '../widget/whatsapp_button.dart';
import '../widget/whatsapp_text_input.dart';


class WhatsAppView extends GetView<WhatsAppController> {
  const WhatsAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'WhatsApp Service',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Enter Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                WhatsAppTextInput(
                  controller: phoneController,
                  label: 'Phone Number with Country Code',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Example: +62812345678',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),
                Obx(() => WhatsAppButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.openWhatsAppChat(phoneController.text),
                  text: controller.isLoading.value
                      ? 'Opening WhatsApp...'
                      : 'Open WhatsApp Chat',
                )),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• Make sure to include the country code\n'
                            '• Do not include spaces or special characters\n'
                            '• WhatsApp must be installed on your device',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}