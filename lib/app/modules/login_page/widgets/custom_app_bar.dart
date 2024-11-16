import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Tambahkan variabel untuk title
  final bool showBackButton; // Menyimpan informasi apakah tombol kembali ditampilkan
  final VoidCallback onBack; // Menyimpan fungsi untuk tombol kembali

  const CustomAppBar({
    super.key,
    required this.showBackButton, // Definisikan showBackButton sebagai required
    required this.title, // Definisikan title sebagai required
    required this.onBack, // Definisikan onBack sebagai required
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onBack, // Panggil fungsi onBack ketika tombol ditekan
      )
          : null, // Jika tidak ingin menampilkan tombol, set null
      title: Text(title, style: const TextStyle(color: Colors.black)), // Gunakan title di AppBar
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
