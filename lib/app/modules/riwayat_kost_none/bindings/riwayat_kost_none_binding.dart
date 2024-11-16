import 'package:get/get.dart';
import '../controllers/riwayat_kost_none_controller.dart';

class RiwayatKostNoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RiwayatKostNoneController());
  }
}