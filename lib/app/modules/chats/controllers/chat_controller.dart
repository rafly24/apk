import 'package:get/get.dart';

class ChatItem {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final String time;
  final int unreadCount;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.imageUrl,
    required this.time,
    this.unreadCount = 0,
  });
}

class ChatController extends GetxController {
  final chatItems = <ChatItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    chatItems.addAll([
      ChatItem(
        name: 'Kos dekat UMM',
        lastMessage: 'Kamar ini masih tersedia. Jika kamu mau untuk menghubungi kami ada nomor yang diberikan...',
        imageUrl: 'assets/kamar3.jpeg',
        time: '20:21',
        unreadCount: 2,
      ),
      ChatItem(
        name: 'Kos Putra BCT',
        lastMessage: 'Kamar ini masih tersedia. Jika kamu mau untuk menghubungi kami ada nomor yang diberikan...',
        imageUrl: 'assets/kamar2.jpeg',
        time: 'Yesterday',
      ),
      ChatItem(
        name: 'Kos Putra Jetis',
        lastMessage: 'Kamar ini masih tersedia. Jika kamu mau untuk menghubungi kami ada nomor yang diberikan...',
        imageUrl: 'assets/kamar3.jpeg',
        time: '2 days ago',
      ),
    ]);
  }

  void search(String query) {
    // Implement search functionality
  }
}