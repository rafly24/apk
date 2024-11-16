import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manajement_kost/app/routes/app_routes.dart';

class SettingsController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final emailRecommendations = true.obs;
  final chatNotifications = true.obs;

  void toggleEmailRecommendations() => emailRecommendations.toggle();
  void toggleChatNotifications() => chatNotifications.toggle();

  Future<void> deleteUserAccount() async {
    try {
      final User? user = _auth.currentUser;
      if (user == null) throw 'No user logged in';

      // Meminta pengguna untuk memasukkan kembali kredensial mereka
      String email = user.email!;
      String password = ''; // Anda perlu mendapatkan password dari pengguna

      // Tampilkan dialog untuk meminta password
      final passwordController = TextEditingController();
      final bool? confirmed = await Get.defaultDialog<bool>(
        title: 'Confirm Password',
        content: Column(
          children: [
            const Text(
                'Please enter your password to confirm account deletion.'),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
          ],
        ),
        confirm: TextButton(
          onPressed: () {
            Get.back(result: true); // Kembali dengan true jika konfirmasi
          },
          child: const Text('Confirm'),
        ),
        cancel: TextButton(
          onPressed: () =>
              Get.back(result: false), // Kembali dengan false jika batal
          child: const Text('Cancel'),
        ),
      );

      if (confirmed == true) {
        password = passwordController.text;

        // Re-authenticate user
        final credential =
            EmailAuthProvider.credential(email: email, password: password);
        await user.reauthenticateWithCredential(credential);

        // Setelah berhasil re-authenticate, hapus data user dari Firestore
        final String userId = user.uid;

        await _firestore.collection('profile').doc(userId).delete();
        // Tambahkan collection lain yang perlu dihapus jika ada

        // Hapus akun
        await user.delete();

        // Sign out
        await _auth.signOut();

        // Tampilkan pesan sukses
        Get.snackbar(
          'Success',
          'Account deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
        );

        // Navigasi ke halaman register
        Get.toNamed(AppRoutes.LOGIN_PAGE); // Sesuaikan dengan route register Anda
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete account: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    }
  }

  void showDeleteConfirmationDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text(
            'Are you sure you want to delete your account from RaKo?'),
        content: const Text(
            'Once you delete this account all the data will be lost and unable to recover!'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            child: const Text('Back'),
          ),
          TextButton(
            onPressed: () async {
              Get.back(); // Close dialog
              await deleteUserAccount(); // Delete account
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
