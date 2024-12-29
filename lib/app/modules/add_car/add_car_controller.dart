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
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child(BaroTexts.cars)
          .child(
              '/${DateTime.now().millisecondsSinceEpoch}.${BaroTexts.photoJpgFormat}');
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
            .child(BaroTexts.storageImage)
            .child("/${randomString(13)}.${BaroTexts.photoJpgFormat}");
        UploadTask task = imagefile.putFile(selectedImage.value!);
        TaskSnapshot snapshot = await task;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        imageUrl.value = downloadUrl;

        if (imageUrl.value.isNotEmpty) {
          String formattedTimestamp =
              DateFormat(BaroTexts.dateFormat).format(DateTime.now());
          Map<String, String> contact = {
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
            BaroTexts.emailPenjual: emailPenjual!,
          };

          DatabaseReference dbRef =
              FirebaseDatabase.instance.ref().child(BaroTexts.cars);
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
