import 'dart:async';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
    final hours = (seconds ~/ 3600) % 24; // Hitung jam dengan membagi total detik dengan 3600 (detik dalam satu jam)
    final minutes = (seconds ~/ 60) % 60; // Hitung menit dengan membagi total detik dengan 60 (detik dalam satu menit)
    final remainingSeconds = seconds % 60;
    final hoursStr = hours < 10 ? '0$hours' : '$hours';
    final minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    final secondsStr = remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
