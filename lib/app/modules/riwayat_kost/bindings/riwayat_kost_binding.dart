import 'package:get/get.dart';
import '../controllers/riwayat_kost_controller.dart';

class RiwayatKostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatKostController>(
          () => RiwayatKostController(),
    );
  }
}