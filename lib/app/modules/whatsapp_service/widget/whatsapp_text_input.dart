// lib/widgets/whatsapp_text_input.dart
import 'package:flutter/material.dart';

class WhatsAppTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const WhatsAppTextInput({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}