import 'package:get/get.dart';
import '../controllers/my_kos_controller.dart';

class MyKosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyKosController>(
      () => MyKosController(),
    );
  }
}