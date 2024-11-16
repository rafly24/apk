import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manajement_kost/app/widgets/custom_bottom_nav.dart'; // Import baru
import '../controllers/my_kos_controller.dart';

class MyKosView extends GetView<MyKosController> {
  const MyKosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                Obx(() => Text(
                      'Hello ${controller.userName.value}!',
                      style: const TextStyle(fontSize: 16),
                    )),

                const SizedBox(height: 16),
                const Text(
                  'Tempat tinggal anda saat ini',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                // Kos Card
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          'assets/kamar2.jpeg',
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Wanita',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Obx(() => Text(
                                  controller.kosName.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Obx(() => Text(
                                  controller.kosAddress.value,
                                  style: const TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Review Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.chat_bubble_outline),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Bagaimana pengalaman kamu di RaKo\nApakah menyenangkan atau justru mengecewakan?\nAyo tulis disini!',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),

                // Activities Section
                const SizedBox(height: 24),
                const Text(
                  'My Dormitory Activities',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Menu Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem(
                      icon: Icons.description_outlined,
                      label: 'Contract',
                      onTap: controller.onContractTap,
                    ),
                    _buildMenuItem(
                      icon: Icons.payment_outlined,
                      label: 'Pay Bills',
                      onTap: controller.onPayBillsTap,
                    ),
                    _buildMenuItem(
                      icon: Icons.chat_bubble_outline,
                      label: 'Complaint',
                      onTap: controller.onComplaintTap,
                    ),
                    _buildMenuItem(
                      icon: Icons.headphones_outlined,
                      label: 'Help',
                      onTap: controller.onHelpTap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
