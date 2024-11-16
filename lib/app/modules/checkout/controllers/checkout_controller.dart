import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manajement_kost/app/routes/app_routes.dart';

class CheckoutController extends GetxController {
  // Observable variables dengan syntax yang benar
  final selectedDate = DateTime.now().obs;
  final totalPayment = 500000.0.obs;
  final currentStep = 0.obs;
  final voucherCode = ''.obs;
  final kosName = 'Kos dekat UMM'.obs;
  final location = 'Jl. Raya Jetis'.obs;
  final facilities = 'Wifi - Meja - Lemari - Kasur'.obs;

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateStep(int step) {
    currentStep.value = step;
  }

  void applyVoucher(String code) {
    voucherCode.value = code;
    calculateTotal();
  }

  void calculateTotal() {
    if (voucherCode.value.isNotEmpty) {
      totalPayment.value = 500000.0 * 0.9; // 10% discount
    } else {
      totalPayment.value = 500000.0;
    }
  }

  void processCheckout() {
    Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              const SizedBox(height: 16),
              const Text(
                'Application submitted successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Application has been approved by\nthe owner successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.PAYMENT);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 45),
                ),
                child: const Text('Payment'),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onInit() {
    super.onInit();
    calculateTotal();
  }
}