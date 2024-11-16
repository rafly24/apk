import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
class PaymentController extends GetxController {
  void processPayment() {
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
                'Thank You!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Payment done successfully',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                'We will let you know when the owner verifies\nyour payment',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () => Get.offAllNamed(AppRoutes.HOMEPAGE),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                ),
                child: const Text('Back to Home Page'),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}