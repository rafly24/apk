import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajement_kost/app/routes/app_routes.dart';
import '../controllers/kos_controller.dart';
import '../widgets/kost_list_item.dart';

class HomepageView extends StatelessWidget {
  final HomepageController controller = Get.put(HomepageController());

  HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigasi ke halaman HOME saat tombol kembali ditekan
            Get.toNamed(AppRoutes.HOME);
          },
        ),
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.black54),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search Kos...',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    // Handle the search input
                    print("Searching for: $value");
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Filter button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Filter'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {
                    // Handle Managed by Rako button
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Managed by Rako'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Found 99+ Kos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.kosList.isEmpty) {
                return const Center(child: Text('No Kos Available'));
              } else {
                return ListView.builder(
                  itemCount: controller.kosList.length,
                  itemBuilder: (context, index) {
                    final kos = controller.kosList[index];
                    return KosListItem(kos: kos);
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
