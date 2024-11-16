// date_picker_binding.dart
import 'package:get/get.dart';
import 'package:manajement_kost/app/modules/date_picker/controllers/date_picket_controller.dart';

class DatePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatePickerController>(() => DatePickerController());
  }
}