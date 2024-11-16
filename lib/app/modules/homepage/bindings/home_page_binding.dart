import 'package:get/get.dart';
import 'package:manajement_kost/app/modules/homepage/controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}