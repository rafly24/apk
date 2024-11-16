import 'package:get/get.dart';
import '../controllers/not_paid_bills_controller.dart';

class NotPaidBillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotPaidBillsController());
  }
}