import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/room_detail_controller.dart';
import '../widgets/room_detail_widgets.dart';

class RoomDetailView extends GetView<RoomDetailController> {
  const RoomDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoomDetailWidgets(controller: controller),
    );
  }
}
