import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeConverterController extends GetxController {
  TextEditingController inputController = TextEditingController();

  List<String> timeUnits = [
    'Seconds',
    'Minutes',
    'Hours',
    'Days',
    'Weeks',
    'Months',
    'Years',
  ];
  RxBool isChecked = false.obs;
  RxString selectedUnit = 'Seconds'.obs;
  RxBool isValidInput = true.obs;
  RxDouble timeInYears = 0.0.obs;
  RxDouble timeInMonths = 0.0.obs;
  RxDouble timeInWeeks = 0.0.obs;
  RxDouble timeInDays = 0.0.obs;
  RxDouble timeInHours = 0.0.obs;
  RxDouble timeInMinutes = 0.0.obs;
  RxDouble timeInSeconds = 0.0.obs;

  void convertTime() {
    isValidInput.value = true;
    isChecked.value = true;
    String input = inputController.text;

    if (input.isEmpty) {
      isValidInput.value = false;
      return;
    }

    double timeValue = double.tryParse(input) ?? 0.0;
    log('Time Value: $timeValue');

    // Convert to seconds based on selected unit
    switch (selectedUnit.value) {
      case 'Years':
        timeInSeconds.value = timeValue * 31104000; // 1 Year = 365.25 days in seconds
        break;
      case 'Months':
        timeInSeconds.value = timeValue * 2592000; // 1 Month = 30.44 days in seconds
        break;
      case 'Weeks':
        timeInSeconds.value = timeValue * 604800; // 1 Week = 7 days in seconds
        break;
      case 'Days':
        timeInSeconds.value = timeValue * 86400; // 1 Day = 24 hours in seconds
        log('Time in seconds: $timeInSeconds');
        break;
      case 'Hours':
        timeInSeconds.value = timeValue * 3600; // 1 Hour = 60 minutes in seconds
        break;
      case 'Minutes':
        timeInSeconds.value = timeValue * 60; // 1 Minute = 60 seconds
        break;
      case 'Seconds':
        timeInSeconds.value = timeValue; // Already in seconds
        break;
      default:
        timeInSeconds = 0.0.obs; // Fallback case
        break;
    }

    formatFullTime(timeInSeconds.value);
  }

  void formatFullTime(double secondsInput) {
    double seconds = secondsInput;

    timeInYears.value = seconds / 31104000; 
    seconds %= 31104000;

    timeInMonths.value = seconds / 2592000; 
    seconds %= 2592000;

    timeInWeeks.value = seconds / 604800;
    seconds %= 604800;

    timeInDays.value = seconds / 86400; 
    seconds %= 86400;

    timeInHours.value = seconds / 3600; 
    seconds %= 3600;

    timeInMinutes.value = seconds / 60; 
    timeInSeconds.value = seconds % 60; 
  }
}
