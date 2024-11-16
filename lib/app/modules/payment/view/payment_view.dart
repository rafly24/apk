import '../controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: const Text('Payment'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Stepper (sama seperti checkout)
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildStepIndicator(1, 'Pengajuan', true),
                _buildStepLine(),
                _buildStepIndicator(2, 'Pemilik\nmenyetujui', true),
                _buildStepLine(),
                _buildStepIndicator(3, 'Pembayaran\nawal', true),
                _buildStepLine(),
                _buildStepIndicator(4, 'Berhasil\nbooking', false),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('No. Invoice'),
                const Text('123456789098765432'),
                const SizedBox(height: 16),
                
                const Text('Type of Payment'),
                const Text('Check-in room for 1 month'),
                const SizedBox(height: 16),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Payment Method'),
                    TextButton(
                      onPressed: () {
                        // Tambahkan logika untuk edit payment method
                      },
                      child: const Text('Edit', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
                const Text('Bank Negara Indonesia'),
                
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Paid'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '500.000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Tambahkan logika untuk see details
                          },
                          child: const Text(
                            'See details',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => controller.processPayment(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 45),
              ),
              child: const Text('Pay Now'),
            ),
          ),
        ],
      ),
    );
  }
}
// Tambahkan method ini di dalam class PaymentView
Widget _buildStepIndicator(int step, String label, bool isActive) {
  return Expanded(
    child: Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.green : Colors.grey.shade300,
          ),
          child: Center(
            child: Text(
              step.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.green : Colors.grey,
          ),
        ),
      ],
    ),
  );
}

Widget _buildStepLine() {
  return Expanded(
    child: Container(
      height: 1,
      color: Colors.grey.shade300,
    ),
  );
}