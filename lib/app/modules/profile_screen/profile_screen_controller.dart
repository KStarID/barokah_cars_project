import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var name = ''.obs;
  var email = ''.obs;
  var profileImageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Set email dari auth
        email.value = user.email ?? '';

        DocumentSnapshot userSnapshot =
            await _userCollection.doc(user.uid).get();
        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;
          // Update nilai observable
          name.value = userData['name'] ?? '';
          profileImageUrl.value = userData['profileImageUrl'] ?? '';
        } else {
          // Jika dokumen belum ada, buat baru
          await createUserDocument();
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await uploadImage(image);
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadImage(File image) async {
    try {
      Get.dialog(
        const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE92027)),
              strokeWidth: 5,
            ),
          ),
        ),
        barrierDismissible: false,
      );

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(image);

      String imageUrl = await ref.getDownloadURL();

      profileImageUrl.value = imageUrl;

      User? user = _auth.currentUser;
      if (user != null) {
        await _userCollection.doc(user.uid).update({
          'profileImageUrl': imageUrl,
        });
      }

      Get.back();
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> updateName(String newName) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _userCollection.doc(user.uid).update({
          'name': newName,
        });
        name.value = newName;
        Get.snackbar('Sukses', 'Nama berhasil diperbarui',
            backgroundColor: const Color(0xFFE92027), colorText: Colors.white);
      }
    } catch (e) {
      print('Error updating name: $e');
      Get.snackbar('Error', 'Gagal memperbarui nama',
          backgroundColor: const Color(0xFFE92027), colorText: Colors.white);
    }
  }

  Future<void> createUserDocument() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Cek apakah dokumen sudah ada
        DocumentSnapshot userDoc = await _userCollection.doc(user.uid).get();

        if (!userDoc.exists) {
          // Buat dokumen baru jika belum ada
          await _userCollection.doc(user.uid).set({
            'email': user.email,
            'name': name.value,
            'profileImageUrl': profileImageUrl.value,
            'createdAt': FieldValue.serverTimestamp(),
          });

          // Update nilai observable setelah membuat dokumen
          email.value = user.email ?? '';
        }
      }
    } catch (e) {
      print('Error creating user document: $e');
    }
  }
}
