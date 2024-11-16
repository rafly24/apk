import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/settings_controller.dart';

Widget buildNotificationSection(SettingsController controller) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.notifications_none, color: Colors.black),
              SizedBox(width: 8),
              Text('Notification', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.keyboard_arrow_up, color: Colors.black),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() => buildCheckboxListTile(
            'Recommendations via mail',
            controller.emailRecommendations.value,
            controller.toggleEmailRecommendations,
          )),
          Obx(() => buildCheckboxListTile(
            'Notifications of chat',
            controller.chatNotifications.value,
            controller.toggleChatNotifications,
          )),
        ],
      ),
    ),
  );
}

Widget buildDeleteAccountSection(SettingsController controller) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: const Icon(Icons.delete_forever, color: Colors.red),
      title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
      onTap: () => controller.showDeleteConfirmationDialog(),
    ),
  );
}

Widget buildCheckboxListTile(String title, bool value, Function() onChanged) {
  return ListTile(
    title: Text(title),
    trailing: Checkbox(
      value: value,
      onChanged: (_) => onChanged(),
      activeColor: Colors.green,
    ),
  );
}