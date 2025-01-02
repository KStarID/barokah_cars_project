import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:random_string/random_string.dart';

import '../../utils/constants/text_strings.dart';
import '../home/home_controller.dart';

class AddCarController extends GetxController {
  final TextEditingController merkController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController hargaJualController = TextEditingController();
  final TextEditingController narahubungController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tahunPembuatanController =
      TextEditingController();
  final TextEditingController warnaController = TextEditingController();
  var bahanBakarValue = BaroTexts.defaultBahanBakar.obs;
  var transmisiValue = BaroTexts.defaultTransmisi.obs;
  var kondisiValue = BaroTexts.defaultKondisi.obs;
  RxString imageUrl = BaroTexts.defaultImageUrl.obs;
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
    bahanBakarValue.value = BaroTexts.defaultBahanBakar;
    transmisiValue.value = BaroTexts.defaultTransmisi;
    kondisiValue.value = BaroTexts.defaultKondisi;
    selectedImage.value = null;
  }

  Future<void> addCarDetails(Map<String, dynamic> carInfoMap, String id) async {
    DatabaseReference databaseReferences = FirebaseDatabase.instance
        .ref()
        .child(BaroTexts.cars)
        .child(randomString(19));
    try {
      await databaseReferences.set(carInfoMap);
      print(BaroTexts.newsCarAdded);
    } catch (e) {
      print(BaroTexts.cannotAddCar);
    }
  }

  Future<void> uploadImage(File image) async {
    try {
      final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {
          'uploadedBy': FirebaseAuth.instance.currentUser?.uid ?? '',
          'uploadedAt': DateTime.now().toString(),
        },
      );

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(image, metadata);
      String downloadURL = await ref.getDownloadURL();
      imageUrl.value = downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      Get.snackbar(
        'Error',
        'Gagal mengupload gambar',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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

    if (user == null) {
      Get.snackbar(
        'Error',
        'Anda harus login terlebih dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (selectedImage.value != null) {
      try {
        // Tampilkan loading dialog yang lebih informatif
        Get.dialog(
          WillPopScope(
            onWillPop: () async => false, // Prevent closing with back button
            child: Dialog(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFE92027)),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Sedang mengupload gambar...',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    StreamBuilder<TaskSnapshot>(
                      stream: uploadTask?.snapshotEvents,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final progress = snapshot.data!.bytesTransferred /
                              snapshot.data!.totalBytes;
                          final percentage =
                              (progress * 100).toStringAsFixed(1);
                          return Text(
                            '$percentage%',
                            style: const TextStyle(fontSize: 14),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          barrierDismissible: false,
        );

        // Upload gambar
        var imagefile = FirebaseStorage.instance
            .ref()
            .child("images")
            .child("${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg");

        // Simpan reference upload task untuk progress monitoring
        uploadTask = imagefile.putFile(selectedImage.value!);

        try {
          TaskSnapshot snapshot = await uploadTask!;
          String downloadUrl = await snapshot.ref.getDownloadURL();
          imageUrl.value = downloadUrl;

          if (imageUrl.value.isNotEmpty) {
            String formattedTimestamp =
                DateFormat(BaroTexts.dateFormat).format(DateTime.now());

            Map<String, String> carData = {
              BaroTexts.merk: merkController.text,
              BaroTexts.model: modelController.text,
              BaroTexts.bahanBakar: bahanBakarValue.value,
              BaroTexts.transmisi: transmisiValue.value,
              BaroTexts.kondisi: kondisiValue.value,
              BaroTexts.harga: hargaJualController.text,
              BaroTexts.kontakPenjual: narahubungController.text,
              BaroTexts.deskripsi: deskripsiController.text,
              BaroTexts.tahunPembuatan: tahunPembuatanController.text,
              BaroTexts.warna: warnaController.text,
              BaroTexts.image: imageUrl.value,
              BaroTexts.uploadTimestamp: formattedTimestamp,
              BaroTexts.emailPenjual: user.email!,
            };

            // Update loading message
            Get.back();
            Get.dialog(
              const Dialog(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFFE92027)),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Menyimpan data mobil...',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              barrierDismissible: false,
            );

            DatabaseReference dbRef =
                FirebaseDatabase.instance.ref().child(BaroTexts.cars);
            await dbRef.push().set(carData);

            Get.back(); // Tutup loading

            // Clear form setelah berhasil
            clearForm();
          }
        } catch (e) {
          Get.back(); // Tutup loading
          throw e;
        }
      } catch (e) {
        Get.back(); // Tutup loading
        print('Error: $e');
        Get.snackbar(
          'Error',
          'Gagal menambahkan data mobil',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Silakan pilih gambar terlebih dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void initializeWithCarData(Map<String, dynamic> car) {
    Future.microtask(() {
      merkController.text = car[BaroTexts.merk] ?? '';
      modelController.text = car[BaroTexts.model] ?? '';
      tahunPembuatanController.text = car[BaroTexts.tahunPembuatan] ?? '';
      warnaController.text = car[BaroTexts.warna] ?? '';
      bahanBakarValue.value =
          car[BaroTexts.bahanBakar] ?? BaroTexts.defaultBahanBakar;
      transmisiValue.value =
          car[BaroTexts.transmisi] ?? BaroTexts.defaultTransmisi;
      kondisiValue.value = car[BaroTexts.kondisi] ?? BaroTexts.defaultKondisi;
      hargaJualController.text = car[BaroTexts.harga] ?? '';
      narahubungController.text = car[BaroTexts.kontakPenjual] ?? '';
      deskripsiController.text = car[BaroTexts.deskripsi] ?? '';
      imageUrl.value = car[BaroTexts.image] ?? '';
    });
  }

  Future<void> updateCarDetails(String carId) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('cars').child(carId);
    Map<String, dynamic> updatedCarData = {
      BaroTexts.merk: merkController.text,
      BaroTexts.model: modelController.text,
      BaroTexts.tahunPembuatan: tahunPembuatanController.text,
      BaroTexts.warna: warnaController.text,
      BaroTexts.bahanBakar: bahanBakarValue.value,
      BaroTexts.transmisi: transmisiValue.value,
      BaroTexts.kondisi: kondisiValue.value,
      BaroTexts.harga: hargaJualController.text,
      BaroTexts.kontakPenjual: narahubungController.text,
      BaroTexts.deskripsi: deskripsiController.text,
      BaroTexts.image: imageUrl.value,
    };

    try {
      await databaseReference.update(updatedCarData);
      print(BaroTexts.successUpdateCar);

      // Reload cars after updating one
      Get.find<HomeController>().loadCars();
    } catch (e) {
      print('${BaroTexts.cannotUpdateCarData} $e');
    }
  }

  Future<void> deleteCar(String carId) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child(BaroTexts.cars).child(carId);
    try {
      await databaseReference.remove();
      print(BaroTexts.saveCar);

      // Reload cars after deleting one
      Get.find<HomeController>().loadCars();
    } catch (e) {
      print('${BaroTexts.cannotDeleteCar} $e');
    }
  }
}

// Tambahkan variable untuk tracking upload task
UploadTask? uploadTask;
