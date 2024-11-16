import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(String) onImagePicked;
  final String? imagePath;

  const ImagePickerWidget({super.key, required this.onImagePicked, this.imagePath});

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      onImagePicked(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imagePath != null
            ? Image.file(
          File(imagePath!),
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        )
            : const Placeholder(
          fallbackHeight: 200,
          fallbackWidth: double.infinity,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => _pickImage(context),
          child: const Text('Pilih Gambar'),
        ),
      ],
    );
  }

  ImagePicker() {}
}