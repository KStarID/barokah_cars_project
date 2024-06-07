import 'package:barokah_cars_project/app/modules/home/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:random_string/random_string.dart';
import 'package:intl/intl.dart';

class AddCarController extends GetxController {
  final TextEditingController merkController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController hargaJualController = TextEditingController();
  final TextEditingController narahubungController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tahunPembuatanController =
      TextEditingController();
  final TextEditingController warnaController = TextEditingController();
  var bahanBakarValue = 'Bensin (Gasoline)'.obs;
  var transmisiValue = 'Manual'.obs;
  var kondisiValue = 'Baru'.obs;
  RxString imageUrl = ''.obs;
  ImagePicker image = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  void clearForm() {
    merkController.clear();
    modelController.clear();
    hargaJualController.clear();
    narahubungController.clear();
    deskripsiController.clear();
    tahunPembuatanController.clear();
    warnaController.clear();
    bahanBakarValue.value = 'Bensin (Gasoline)';
    transmisiValue.value = 'Manual';
    kondisiValue.value = 'Baru';
    selectedImage.value = null;
  }

  Future<void> addCarDetails(Map<String, dynamic> carInfoMap, String id) async {
    DatabaseReference databaseReferences =
        FirebaseDatabase.instance.ref().child('cars').child(randomString(19));
    try {
      await databaseReferences.set(carInfoMap);
      print('Mobil berhasil ditambahkan');
    } catch (e) {
      print('Terjadi kesalahan, tidak dapat menambahkan mobil');
    }
  }

  Future<void> uploadImage(File image) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('cars')
          .child('/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await ref.putFile(image);
      String downloadURL = await ref.getDownloadURL();
      imageUrl.value = downloadURL;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getImage() async {
    final XFile? img = await image.pickImage(source: ImageSource.gallery);
    if (img != null) {
      selectedImage.value = File(img.path);
    }
  }

  Future<void> uploadFile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? emailPenjual = user?.email;
    if (selectedImage.value != null) {
      try {
        var imagefile = FirebaseStorage.instance
            .ref()
            .child("Images")
            .child("/${randomString(13)}.jpg");
        UploadTask task = imagefile.putFile(selectedImage.value!);
        TaskSnapshot snapshot = await task;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        imageUrl.value = downloadUrl;

        if (imageUrl.value.isNotEmpty) {
          String formattedTimestamp =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          Map<String, String> contact = {
            'merk': merkController.text,
            'model': modelController.text,
            'bahan_bakar': bahanBakarValue.value,
            'transmisi': transmisiValue.value,
            'kondisi': kondisiValue.value,
            'harga': hargaJualController.text,
            'kontak_penjual': narahubungController.text,
            'deskripsi': deskripsiController.text,
            'tahun_pembuatan': tahunPembuatanController.text,
            'warna': warnaController.text,
            'image': imageUrl.value,
            'upload_timestamp': formattedTimestamp,
            'email_penjual': emailPenjual!,
          };

          DatabaseReference dbRef =
              FirebaseDatabase.instance.ref().child('cars');
          await dbRef.push().set(contact);

          // Reload cars after adding new one
          Get.find<HomeController>().loadCars();
        }
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  void initializeWithCarData(Map<String, dynamic> car) {
    merkController.text = car['merk'] ?? '';
    modelController.text = car['model'] ?? '';
    tahunPembuatanController.text = car['tahun_pembuatan'] ?? '';
    warnaController.text = car['warna'] ?? '';
    bahanBakarValue.value = car['bahan_bakar'] ?? 'Bensin (Gasoline)';
    transmisiValue.value = car['transmisi'] ?? 'Manual';
    kondisiValue.value = car['kondisi'] ?? 'Baru';
    hargaJualController.text = car['harga'] ?? '';
    narahubungController.text = car['kontak_penjual'] ?? '';
    deskripsiController.text = car['deskripsi'] ?? '';
    imageUrl.value = car['image'] ?? '';
  }

  Future<void> updateCarDetails(String carId) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('cars').child(carId);
    Map<String, dynamic> updatedCarData = {
      'merk': merkController.text,
      'model': modelController.text,
      'tahun_pembuatan': tahunPembuatanController.text,
      'warna': warnaController.text,
      'bahan_bakar': bahanBakarValue.value,
      'transmisi': transmisiValue.value,
      'kondisi': kondisiValue.value,
      'harga': hargaJualController.text,
      'kontak_penjual': narahubungController.text,
      'deskripsi': deskripsiController.text,
      'image': imageUrl.value,
    };

    try {
      await databaseReference.update(updatedCarData);
      print('Data mobil berhasil diperbarui');

      // Reload cars after updating one
      Get.find<HomeController>().loadCars();
    } catch (e) {
      print('Terjadi kesalahan, tidak dapat memperbarui data mobil: $e');
    }
  }

  Future<void> deleteCar(String carId) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('cars').child(carId);
    try {
      await databaseReference.remove();
      print('Mobil berhasil dihapus');

      // Reload cars after deleting one
      Get.find<HomeController>().loadCars();
    } catch (e) {
      print('Terjadi kesalahan, tidak dapat menghapus mobil: $e');
    }
  }
}
