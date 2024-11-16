import 'package:flutter/material.dart';

class HelpText extends StatelessWidget {
  final VoidCallback onTap;

  const HelpText({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: [
          const TextSpan(text: 'Need Help? '),
          WidgetSpan(
            child: GestureDetector(
              onTap: onTap,
              child: const Text(
                'Click Here',
                style: TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}