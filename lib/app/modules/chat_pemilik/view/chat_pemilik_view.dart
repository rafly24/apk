import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/chat_pemilik_controller.dart';

class ChatPemilikView extends GetView<ChatPemilikController> {
  final TextEditingController messageController = TextEditingController();

  ChatPemilikView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Chat Pemilik',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount:
                    controller.messages.length + controller.voiceNotes.length,
                itemBuilder: (context, index) {
                  if (index < controller.messages.length) {
                    final message = controller.messages[index];
                    return ChatBubble(message: message);
                  } else {
                    final voiceNote = controller
                        .voiceNotes[index - controller.messages.length];
                    return VoiceNoteTile(
                        voiceNote: voiceNote, controller: controller);
                  }
                },
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              if (controller.isRecording.value) {
                await controller.stopRecording();
              } else {
                await controller.startRecording();
              }
            },
            child: Obx(
              () => CircleAvatar(
                radius: 20,
                backgroundColor:
                    controller.isRecording.value ? Colors.red : Colors.green,
                child: Icon(
                  controller.isRecording.value ? Icons.stop : Icons.mic,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Ketik pesan...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              if (messageController.text.isNotEmpty) {
                controller.sendMessage(messageController.text);
                messageController.clear();
              }
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: message.isMe ? 64 : 0,
          right: message.isMe ? 0 : 64,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.green : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isMe ? Colors.white : Colors.black87,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class VoiceNoteTile extends StatelessWidget {
  final VoiceNote voiceNote;
  final ChatPemilikController controller;

  const VoiceNoteTile(
      {required this.voiceNote, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.audiotrack, color: Colors.green),
      title: Text("Voice Note - ${voiceNote.timestamp.toLocal()}"),
      trailing: Obx(
        () => IconButton(
          icon:
              Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow),
          onPressed: () => controller.playVoiceNote(voiceNote.filePath),
        ),
      ),
    );
  }
}
