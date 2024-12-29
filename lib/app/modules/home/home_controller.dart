import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/text_strings.dart';

class HomeController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection(BaroTexts.user);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxInt seconds = 0.obs;
  int totalSeconds = 86400;
  final carouselCurrentIndex = 0.obs;
  String? filterCondition;

  Timer? _timer;

  RxList<Map<String, dynamic>> allCars = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredCars = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
    fetchAllCars();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (totalSeconds > 0) {
        totalSeconds--;
        seconds.value = totalSeconds;
      } else {
        timer.cancel();
      }
    });
  }

  void fetchAllCars() async {
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child(BaroTexts.cars);
    databaseReference.once().then((snapshot) {
      if (snapshot.snapshot.value != null) {
        Map<dynamic, dynamic> data =
            snapshot.snapshot.value as Map<dynamic, dynamic>;
        List<Map<String, dynamic>> cars = [];
        data.forEach((key, value) {
          Map<String, dynamic> car = Map<String, dynamic>.from(value);
          car[BaroTexts.key] = key;
          cars.add(car);
        });
        allCars.assignAll(cars);
        filteredCars.assignAll(cars);
      }
    });
  }

  void loadCars() {
    fetchAllCars();
  }

  String formatTime(int seconds) {
    final hours = (seconds ~/ 3600) % 24;
    final minutes = (seconds ~/ 60) % 60;
    final remainingSeconds = seconds % 60;
    final hoursStr = hours < 10 ? '0$hours' : '$hours';
    final minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    final secondsStr =
        remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    return '$hoursStr:$minutesStr:$secondsStr';
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot =
            await _userCollection.doc(user.uid).get();
        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;
          nameController.text = userData[BaroTexts.name] ?? '';
          emailController.text = userData[BaroTexts.emailFirebase] ?? '';
        } else {
          // ignore: avoid_print
          print(BaroTexts.noUserDataFound);
        }
      } else {
        // ignore: avoid_print
        print(BaroTexts.noUserLoggedIn);
      }
    } catch (e) {
      // ignore: avoid_print
      print('${BaroTexts.errorFetchingUserData} $e');
    }
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  void toggleFilter() {
    if (filterCondition == null) {
      // Set filterCondition ke "Baru" jika null
      filterCondition = BaroTexts.baruFilterCondition;
    } else if (filterCondition == BaroTexts.baruFilterCondition) {
      // Ubah filterCondition ke "Bekas" jika sedang "Baru"
      filterCondition = BaroTexts.bekasFilterCondition;
    } else {
      // Kembalikan filterCondition ke null jika sedang "Bekas"
      filterCondition = null;
    }

    // Panggil metode filterCars() untuk menerapkan filter
    filterCars("");
  }

  void filterCars(String query) {
    if (query.isEmpty) {
      // Jika query kosong, filter berdasarkan kondisi mobil saja
      if (filterCondition == null) {
        // Tampilkan semua mobil jika filterCondition null
        filteredCars.assignAll(allCars);
      } else {
        // Tampilkan mobil sesuai kondisi filter
        filteredCars.assignAll(allCars.where((car) =>
            car[BaroTexts.kondisi] != null &&
            car[BaroTexts.kondisi].toLowerCase() ==
                filterCondition!.toLowerCase()));
      }
    } else {
      // Jika ada query, filter berdasarkan query dan kondisi mobil
      filteredCars.assignAll(allCars
          .where((car) =>
              (car[BaroTexts.model] != null &&
                  car[BaroTexts.model]
                      .toLowerCase()
                      .contains(query.toLowerCase())) &&
              (filterCondition == null ||
                  car[BaroTexts.kondisi] != null &&
                      car[BaroTexts.kondisi].toLowerCase() ==
                          filterCondition!.toLowerCase()))
          .toList());
    }
  }
}
