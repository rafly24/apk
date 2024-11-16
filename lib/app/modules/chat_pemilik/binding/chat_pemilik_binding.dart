import 'package:get/get.dart';
import '../controller/chat_pemilik_controller.dart';

class ChatPemilikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatPemilikController>(
      () => ChatPemilikController(),
    );
  }
}