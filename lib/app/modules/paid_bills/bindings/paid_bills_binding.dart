import 'package:get/get.dart';
import '../controllers/paid_bills_controller.dart';

class PaidBillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaidBillsController());
  }
}