// personal_info_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import '../../profile/controllers/profile_controller.dart';

class PersonalInfoController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable variables
  final fullName = ''.obs;
  final gender = ''.obs;
  final dateOfBirth = ''.obs;
  final work = ''.obs;
  final contactNumber = ''.obs;
  var profileImagePath = ''.obs;
  var profileImageUrl = ''.obs;
  var isProfileImageChanged = false.obs;
  var isLoading = false.obs;
  
  // Tambahkan variabel untuk menandai perubahan
  var isDirty = false.obs;
  var tempData = <String, dynamic>{}.obs;

  final ImagePicker _picker = ImagePicker();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }
  }

  Future<void> loadUserData() async {
    try {
      isLoading.value = true;
      String? userId = _auth.currentUser?.uid;

      if (userId != null) {
        DocumentSnapshot doc =
            await _firestore.collection('profile').doc(userId).get();

        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          // Set data ke variabel temporary dan observable
          tempData.value = Map<String, dynamic>.from(data);
          fullName.value = data['fullName'] ?? '';
          gender.value = data['gender'] ?? 'Select Gender';
          dateOfBirth.value = data['dateOfBirth'] ?? 'Select Date';
          work.value = data['work'] ?? 'Select Work';
          contactNumber.value = data['contactNumber'] ?? '';
          profileImageUrl.value = data['profileImageUrl'] ?? '';
        }
      }
    } catch (e) {
      print('Error loading user data: $e');
      Get.snackbar(
        'Error',
        'Failed to load user data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> _uploadImage(String filePath) async {
    try {
      String userId = _auth.currentUser!.uid;
      String fileName = 'profile_images/$userId.jpg';
      File file = File(filePath);

      await _storage.ref(fileName).putFile(file);
      String downloadUrl = await _storage.ref(fileName).getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
  Future<void> pickImage(ImageSource source) async {
  try {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
      isProfileImageChanged.value = true;
      isDirty.value = true;

      String? imageUrl = await _uploadImage(pickedFile.path);
      if (imageUrl != null) {
        profileImageUrl.value = imageUrl;
        tempData['profileImageUrl'] = imageUrl;
      }
    }
  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to update profile photo',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.1),
    );
  }
}


  Future<void> changePhoto() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImagePath.value = pickedFile.path;
        isProfileImageChanged.value = true;
        isDirty.value = true;

        String? imageUrl = await _uploadImage(pickedFile.path);
        if (imageUrl != null) {
          profileImageUrl.value = imageUrl;
          tempData['profileImageUrl'] = imageUrl;
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update profile photo',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    }
  }

  Future<void> savePersonalInfo() async {
    try {
      if (!isDirty.value) {
        Get.back(); // Kembali jika tidak ada perubahan
        return;
      }

      isLoading.value = true;
      String userId = _auth.currentUser!.uid;

      // Validasi data
      if (fullName.value.isEmpty || 
          gender.value == 'Select Gender' || 
          dateOfBirth.value == 'Select Date' || 
          work.value == 'Select Work' || 
          contactNumber.value.isEmpty) {
        Get.snackbar(
          'Error',
          'Please fill all fields',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
        );
        return;
      }

      // Update data ke Firestore
      Map<String, dynamic> profileData = {
        'fullName': fullName.value,
        'gender': gender.value,
        'dateOfBirth': dateOfBirth.value,
        'work': work.value,
        'contactNumber': contactNumber.value,
        'profileImageUrl': profileImageUrl.value,
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('profile').doc(userId).set(
            profileData,
            SetOptions(merge: true),
          );

      // Reset flag isDirty
      isDirty.value = false;
      
      // Update ProfileController
      await profileController.loadUserData();

      Get.snackbar(
        'Success',
        'Personal information saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
      );

      await Future.delayed(const Duration(seconds: 1));
      Get.back();
      
    } catch (e) {
      print('Error saving personal info: $e');
      Get.snackbar(
        'Error',
        'Failed to save personal information',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Cancel changes
  void cancelChanges() {
    if (isDirty.value) {
      // Kembalikan data ke nilai awal
      fullName.value = tempData['fullName'] ?? '';
      gender.value = tempData['gender'] ?? 'Select Gender';
      dateOfBirth.value = tempData['dateOfBirth'] ?? 'Select Date';
      work.value = tempData['work'] ?? 'Select Work';
      contactNumber.value = tempData['contactNumber'] ?? '';
      profileImageUrl.value = tempData['profileImageUrl'] ?? '';
      
      isDirty.value = false;
    }
    Get.back();
  }

  // Update methods yang dimodifikasi untuk menandai perubahan
  void updateFullName(String newName) {
    fullName.value = newName;
    isDirty.value = true;
  }

  void updateGender(String newGender) {
    gender.value = newGender;
    isDirty.value = true;
  }

  void updateWork(String newWork) {
    work.value = newWork;
    isDirty.value = true;
  }

  void updateDateOfBirth(String newDate) {
    dateOfBirth.value = newDate;
    isDirty.value = true;
  }

  void updateContactNumber(String newNumber) {
    contactNumber.value = newNumber;
    isDirty.value = true;
  }

  // UI methods
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> workOptions = [
    'Employee',
    'Self-Employed',
    'Business Owner',
    'Student',
    'Other'
  ];

  void showGenderPicker() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: genderOptions.map((String value) {
            return ListTile(
              title: Text(value),
              onTap: () {
                updateGender(value);
                Get.back();
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void showWorkPicker() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: workOptions.map((String value) {
            return ListTile(
              title: Text(value),
              onTap: () {
                updateWork(value);
                Get.back();
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void showDatePicker() async {
    final DateTime? picked = await Get.dialog(
      DatePickerDialog(
        initialDate: DateTime(1996, 2, 29),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      ),
    );

    if (picked != null) {
      final String formattedDate = '${picked.day.toString().padLeft(2, '0')}-'
          '${picked.month.toString().padLeft(2, '0')}-'
          '${picked.year.toString()}';
      updateDateOfBirth(formattedDate);
    }
  }
}