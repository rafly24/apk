import 'package:get/get.dart';

class Tagihan {
  final String tanggalJatuhTempo;
  final double jumlah;
  final bool sudahDibayar;

  Tagihan({required this.tanggalJatuhTempo, required this.jumlah, this.sudahDibayar = false});
}

class PaidBillsController extends GetxController {
  final daftarTagihan = <Tagihan>[].obs;

  @override
  void onInit() {
    super.onInit();
    daftarTagihan.addAll([
      Tagihan(tanggalJatuhTempo: '05 April', jumlah: 500000),
      Tagihan(tanggalJatuhTempo: '05 Maret', jumlah: 500000),
      Tagihan(tanggalJatuhTempo: '05 Februari', jumlah: 500000),
      Tagihan(tanggalJatuhTempo: '05 Januari', jumlah: 500000),
    ]);
  }
}