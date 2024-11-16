import 'package:flutter/material.dart';


class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      spacing: 3,
      children: [
        _stepItem("Pengajuan", true),
        _stepItem("Menyetujui", true),
        _stepItem("Pembayaran", true),
        _stepItem("Berhasil", true),
      ],
    );
  }
}

Widget _stepItem(String title, bool isCompleted) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: isCompleted ? Colors.green : Colors.grey,
        child: Icon(
          isCompleted ? Icons.check : Icons.circle_outlined,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 3),
      Text(title),
    ],
  );
}