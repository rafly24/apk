import 'package:get/get.dart';
import 'package:manajement_kost/app/modules/homepage/controllers/kos_controller.dart';
class KosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageController>(() => HomepageController());
  }
}