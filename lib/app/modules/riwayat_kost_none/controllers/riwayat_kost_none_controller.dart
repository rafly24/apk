import 'package:get/get.dart';

class RiwayatKostNoneController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void onSendTap() {
    // Implementasi navigasi ke halaman pencarian kost
    Get.toNamed('/search-kost');
  }
}