// personal_info_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../controllers/personal_info_controller.dart';
import '../widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Personal Information',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Obx(() {
                        if (controller.profileImageUrl.value.isNotEmpty) {
                          return CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: NetworkImage(
                              controller.profileImageUrl.value,
                            ),
                          );
                        } else if (controller.profileImagePath.value.isNotEmpty) {
                          return CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: FileImage(
                              File(controller.profileImagePath.value),
                            ),
                          );
                        } else {
                          return CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                          );
                        }
                      }),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => _showImageSourceOptions(context),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() => CustomTextField(
                  label: 'Full Name',
                  controller: TextEditingController(text: controller.fullName.value)
                    ..selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.fullName.value.length),
                    ),
                  onChanged: controller.updateFullName,
                  hintText: 'Enter your full name',
                )),
                Obx(() => CustomTextField(
                  label: 'Gender',
                  controller: TextEditingController(text: controller.gender.value),
                  readOnly: true,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  onTap: controller.showGenderPicker,
                  hintText: 'Select your gender',
                )),
                Obx(() => CustomTextField(
                  label: 'Date of birth',
                  controller: TextEditingController(text: controller.dateOfBirth.value),
                  readOnly: true,
                  suffixIcon: const Icon(Icons.calendar_today, size: 20),
                  onTap: controller.showDatePicker,
                  hintText: 'Select your date of birth',
                )),
                Obx(() => CustomTextField(
                  label: 'Work',
                  controller: TextEditingController(text: controller.work.value),
                  readOnly: true,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  onTap: controller.showWorkPicker,
                  hintText: 'Select your work',
                )),
                Obx(() => CustomTextField(
                  label: 'Contact Number',
                  controller: TextEditingController(text: controller.contactNumber.value)
                    ..selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.contactNumber.value.length),
                    ),
                  keyboardType: TextInputType.phone,
                  onChanged: controller.updateContactNumber,
                  hintText: 'Enter your contact number',
                )),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.savePersonalInfo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Obx(() => controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // Fungsi untuk menampilkan opsi sumber gambar
  void _showImageSourceOptions(BuildContext context) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () async {
                Navigator.of(context).pop();
                await controller.pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () async {
                Navigator.of(context).pop();
                await controller.pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
