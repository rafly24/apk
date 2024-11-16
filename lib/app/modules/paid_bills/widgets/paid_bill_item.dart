import 'package:flutter/material.dart';
import '../controllers/paid_bills_controller.dart';

class PaidBillsItem extends StatelessWidget {
  final Tagihan tagihan;

  const PaidBillsItem({super.key, required this.tagihan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sudah dibayar', style: TextStyle(color: Colors.grey)),
                Text('Tepat waktu', style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 8),
            Text('Jatuh tempo ${tagihan.tanggalJatuhTempo}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(tagihan.jumlah.toStringAsFixed(0), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}