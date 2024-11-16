import 'package:get/get.dart';
import '../models/kos_models.dart';

class HomepageController extends GetxController {
  var isLoading = false.obs;
  var kosList = <KosModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchKosList();
  }

  void fetchKosList() {
    isLoading.value = true;
    try {
      // Simulasi data kos
      kosList.value = [
        KosModel(
          id: '1',
          name: 'Kost Putri BCT',
          address: 'Jl. Raya Jetis',
          price: '500.000',
          imageUrl: 'assets/kamar1.jpeg',
          facilities: ['Wifi', 'Kamar Mandi Dalam'],
          type: 'Putri',
        ),
        // Tambahkan data kos lainnya
      ];
    } catch (e) {
      print('Error fetching kos list: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToKosDetail(KosModel kos) {
    Get.toNamed('/kos-detail', arguments: kos);
  }
}