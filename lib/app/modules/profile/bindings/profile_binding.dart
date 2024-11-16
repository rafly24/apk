// profile_binding.dart
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../personal_info/controllers/personal_info_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(PersonalInfoController());
  }
}