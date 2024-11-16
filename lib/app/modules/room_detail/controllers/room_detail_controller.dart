import 'package:get/get.dart';

class RoomDetailController extends GetxController {
  var imageUrl = 'assets/kamar1.jpeg'.obs; // Ganti dengan path gambar Anda
  var title = 'Kost Putri BCT'.obs;
  var description = 'Kamar kost yang nyaman dengan fasilitas lengkap Termasuk :\n\n-Listrik \n-Free WiFi \n-Meja Belajar \n-Lemari \n-Kasur \n-Kamar Mandi Dalam \n-Akses 24 jam.'.obs;
  var price = '500.000'.obs; // Harga per bulan
  var isFavorite = false.obs;
  var isShareMenuVisible = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void toggleShareMenu() {
    isShareMenuVisible.value = !isShareMenuVisible.value;
  }

}
