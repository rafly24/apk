// personal_info_binding.dart
import 'package:get/get.dart';
import '../controllers/personal_info_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(PersonalInfoController());
  }
}
