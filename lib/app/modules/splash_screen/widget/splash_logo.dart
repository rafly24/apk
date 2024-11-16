// lib/app/widgets/splash_logo.dart

import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.asset(
        'assets/R_K_alphabet.jpeg',
        fit: BoxFit.contain,
      ),
    );
  }
}