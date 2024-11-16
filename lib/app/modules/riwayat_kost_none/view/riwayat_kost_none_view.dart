import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/riwayat_kost_none_controller.dart';
import '../widgets/empty_state_widget.dart';

class RiwayatKostNoneView extends GetView<RiwayatKostNoneController> {
  const RiwayatKostNoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Submission History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Obx(() => Row(
              children: [
                _buildTab('History', 0, Colors.green),
                _buildTab('Draft', 1, Colors.grey),
                _buildTab('Just Viewed', 2, Colors.grey),
              ],
            )),
          ),
          const Expanded(
            child: EmptyStateWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.onSendTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index, Color textColor) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (index == 0) { // index 0 adalah tab History
            Get.toNamed(AppRoutes.RIWAYAT_KOST); // navigasi ke halaman riwayat kost
          }
          controller.changeTab(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: controller.selectedTabIndex.value == index
                    ? Colors.green
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: controller.selectedTabIndex.value == index
                  ? Colors.green
                  : textColor,
              fontWeight: controller.selectedTabIndex.value == index
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}