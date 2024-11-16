import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/paid_bills_controller.dart';
import '../widgets/paid_bill_item.dart';

class PaidBillsView extends GetView<PaidBillsController> {
  const PaidBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.offAllNamed(AppRoutes.HOME), // Navigasi ke halaman Home
        ),
        title: const Text('Pay Bills', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.NOT_PAID_BILLS), // Navigasi ke halaman Not Paid Bills
                      child: const Text('Belum dibayar', style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Sudah dibayar', style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.daftarTagihan.length,
              itemBuilder: (context, index) {
                final tagihan = controller.daftarTagihan[index];
                return PaidBillsItem(tagihan: tagihan);
              },
            )),
          ),
        ],
      ),
    );
  }
}
