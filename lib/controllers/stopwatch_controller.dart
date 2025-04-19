import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StopwatchController extends GetxController {
  Timer? _timer;

  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  RxBool isRunning = false.obs;
  RxBool isSaved = false.obs;

  RxList<String> savedTimes = <String>[].obs;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void start() {
    if (isRunning.value) return; 

    isRunning.value = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds.value++;
      if (seconds.value == 60) {
        seconds.value = 0;
        minutes.value++;
      }
      if (minutes.value == 60) {
        minutes.value = 0;
        hours.value++;
      }
    });
  }

  void stop() {
    _timer?.cancel();
    isRunning.value = false;
  }

  void reset() {
    stop(); // sekalian stop juga
    hours.value = 0;
    minutes.value = 0;
    seconds.value = 0;
  }

  String get formattedTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(hours.value)}:${twoDigits(minutes.value)}:${twoDigits(seconds.value)}';
  }

  void saveTime() {
    if (isRunning.isFalse) {
      Get.snackbar(
        'Error',
        'Stopwatch is not running.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    isSaved.value = true;
    String time = formattedTime;
    savedTimes.add(time);
    // Reset the stopwatch after saving the time
    reset();

  }
}
