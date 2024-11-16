import 'package:flutter/material.dart';
import '../controllers/not_paid_bills_controller.dart';

class NotPaidBillItem extends StatelessWidget {
  final Bill bill;

  const NotPaidBillItem({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Belum Dibayar', style: TextStyle(color: Colors.grey)),
                Text(
                  bill.status,
                  style: TextStyle(
                    color: bill.status == 'Bayar Sekarang' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Due ${bill.dueDate}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bill.amount.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: bill.isPayButtonEnabled ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: bill.isPayButtonEnabled ? Colors.green : Colors.grey,
                  ),
                  child: const Text('Bayar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}