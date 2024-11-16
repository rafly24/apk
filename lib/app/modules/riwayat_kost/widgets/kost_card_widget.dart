import 'package:flutter/material.dart';

class KostCardWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isConfirmed;
  final String dateOfEntry;
  final String duration;
  final String status;
  final Color statusColor;
  final VoidCallback? onChatPressed;
  final VoidCallback? onPayPressed;
  final String? paymentExpiry;

  const KostCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.isConfirmed,
    required this.dateOfEntry,
    required this.duration,
    required this.status,
    required this.statusColor,
    this.onChatPressed,
    this.onPayPressed,
    this.paymentExpiry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      buildInfoRow(Icons.check_circle_outline, 'Confirmed Room'),
                      const SizedBox(height: 4),
                      buildInfoRow(
                        Icons.calendar_today,
                        'Date of Entry',
                        trailing: dateOfEntry,
                      ),
                      const SizedBox(height: 4),
                      buildInfoRow(
                        Icons.access_time,
                        'Duration',
                        trailing: duration,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (paymentExpiry != null) ...[
              const SizedBox(height: 16),
              Text(
                'Payment expires $paymentExpiry',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
            const SizedBox(height: 16),
            if (onPayPressed != null)
              ElevatedButton(
                onPressed: onPayPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Pay Now'),
              )
            else if (onChatPressed != null)
              OutlinedButton(
                onPressed: onChatPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green, side: const BorderSide(color: Colors.green),
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Chat Owner'),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text, {String? trailing}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        if (trailing != null) ...[
          const Spacer(),
          Text(
            trailing,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ],
    );
  }
}