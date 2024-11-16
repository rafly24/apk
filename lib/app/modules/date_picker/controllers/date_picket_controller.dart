// date_picker_controller.dart
import 'package:get/get.dart';
import 'package:manajement_kost/app/modules/checkout/controllers/checkout_controller.dart';

class DatePickerController extends GetxController {
  final selectedDate = DateTime.now().obs;
  
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void saveDate() {
    final checkoutController = Get.find<CheckoutController>();
    checkoutController.updateDate(selectedDate.value);
    Get.back();
  }
}