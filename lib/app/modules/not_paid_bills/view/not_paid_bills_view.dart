import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/not_paid_bills_controller.dart';
import '../widgets/not_paid_bill_item.dart';

class NotPaidBillsView extends GetView<NotPaidBillsController> {
  const NotPaidBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text('Pay Bills', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Expanded(
        child: Obx(() => ListView.builder(
          itemCount: controller.bills.length,
          itemBuilder: (context, index) {
            return NotPaidBillItem(bill: controller.bills[index]);
          },
        )),
      ),
    );
  }
}
