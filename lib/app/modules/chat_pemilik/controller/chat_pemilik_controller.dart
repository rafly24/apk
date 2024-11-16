import 'package:get/get.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart'; // Tambahkan ini

class ChatPemilikController extends GetxController {
  var messages = <ChatMessage>[].obs;
  var voiceNotes = <VoiceNote>[].obs;

  late FlutterSoundRecorder _recorder;
  late FlutterSoundPlayer _player;
  RxBool isRecording = false.obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    requestPermissions(); // Meminta izin
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    initRecorder();
    messages.add(ChatMessage(
      text: "Hi, saya tertarik dengan kos anda",
      isMe: true,
      timestamp: DateTime.now(),
    ));
  }

  // Fungsi untuk meminta izin
  Future<void> requestPermissions() async {
    await Permission.microphone.request();
    await Permission.storage.request(); // Hanya jika Anda membutuhkannya
  }

  Future<void> initRecorder() async {
    await _recorder.openRecorder();
  }

  Future<void> startRecording() async {
    if (isRecording.value) return;
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.aac';
    await _recorder.startRecorder(toFile: filePath);
    isRecording.value = true;
  }

  Future<void> stopRecording() async {
    if (!isRecording.value) return;
    
    try {
      final filePath = await _recorder.stopRecorder();
      if (filePath != null) {
        print('Rekaman disimpan di: $filePath'); // Tambahkan log untuk debugging
        voiceNotes.add(VoiceNote(filePath: filePath, timestamp: DateTime.now()));
      } else {
        print('Gagal mendapatkan path rekaman');
      }
    } catch (e) {
      print('Error saat menghentikan rekaman: $e');
    } finally {
      isRecording.value = false;
    }
  }

  Future<void> playVoiceNote(String filePath) async {
    if (isPlaying.value) {
      await _player.stopPlayer();
      isPlaying.value = false;
    } else {
      await _player.startPlayer(
        fromURI: filePath,
        whenFinished: () => isPlaying.value = false,
      );
      isPlaying.value = true;
    }
  }

  void sendMessage(String text) {
    messages.add(ChatMessage(
      text: text,
      isMe: true,
      timestamp: DateTime.now(),
    ));
  }

  @override
  void onClose() {
    _recorder.closeRecorder();
    _player.closePlayer();
    super.onClose();
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}

class VoiceNote {
  final String filePath;
  final DateTime timestamp;

  VoiceNote({
    required this.filePath,
    required this.timestamp,
  });
}