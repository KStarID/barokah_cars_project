import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxInt seconds = 0.obs;
  int totalSeconds = 86400;
  
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
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

  String formatTime(int seconds) {
    final hours = (seconds ~/ 3600) % 24;
    final minutes = (seconds ~/ 60) % 60;
    final remainingSeconds = seconds % 60;
    final hoursStr = hours < 10 ? '0$hours' : '$hours';
    final minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    final secondsStr = remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
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
          nameController.text = userData['name'] ?? '';
          emailController.text = userData['email'] ?? '';
        } else {
          print('No user data found.');
        }
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
