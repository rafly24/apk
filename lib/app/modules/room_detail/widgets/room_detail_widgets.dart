import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/room_detail_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../routes/app_routes.dart';

class RoomDetailWidgets extends StatelessWidget {
  final RoomDetailController controller;

  const RoomDetailWidgets({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar Utama
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 250, // Mengubah tinggi gambar untuk memperbesar
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(controller.imageUrl.value),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Tombol back dan favorite
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.share, color: Colors.black),
                          onPressed: () => controller.toggleShareMenu(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Obx(() => IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: controller.isFavorite.value
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              onPressed: () => controller.toggleFavorite(),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        // Informasi Kamar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Kosanan',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                controller.title.value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    'Jl. Raya Jetis',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[400],
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kos managed by RaKo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Just got online',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                controller.description.value, // Menampilkan deskripsi
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        // Bottom Navigation
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp ${controller.price.value}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Estimated Payment',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.CHAT_PEMILIK);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Chat pemilik'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(
                    AppRoutes.CHECKOUT,
                    arguments: {
                      'kosName': controller.title.value,
                      'price': controller.price.value,
                      'location': 'Jl. Raya Jetis',
                      'facilities': 'Meja - Lemari - Kasur',
                      'imageUrl': controller.imageUrl.value,
                    },
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Check out'),
                ),
              ),
            ],
          ),
        ),

        // Share Menu
        Obx(() => controller.isShareMenuVisible.value
            ? Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildShareButton(Icons.copy, 'Salin'),
                    _buildShareButton(FontAwesomeIcons.whatsapp, 'WhatsApp'),
                    _buildShareButton(FontAwesomeIcons.facebook, 'Facebook'),
                    _buildShareButton(Icons.more_horiz, 'Lainnya'),
                  ],
                ),
              )
            : const SizedBox()),
      ],
    );
  }

  Widget _buildShareButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
