// lib/app/widgets/whatsapp_text_input.dart

import 'package:flutter/material.dart';

class VerificationInput extends StatelessWidget {
  final List<TextEditingController> codeControllers;
  final VoidCallback onCompleted;

  const VerificationInput({
    super.key,
    required this.codeControllers,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
            (index) => SizedBox(
          width: 40,
          child: TextField(
            controller: codeControllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: const TextStyle(fontSize: 24, color: Colors.black),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                FocusScope.of(context).nextFocus();
              }
              if (index == 5 && value.isNotEmpty) {
                onCompleted();
              }
            },
          ),
        ),
      ),
    );
  }
}