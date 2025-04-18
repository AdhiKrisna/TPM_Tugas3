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
  double timeInYears = 0.0;
  double timeInMonths = 0.0;
  double timeInWeeks = 0.0;
  double timeInDays = 0.0;
  double timeInHours = 0.0;
  double timeInMinutes = 0.0;
  double timeInSeconds = 0.0;

  void convertTime() {
    isValidInput.value = true;
    isChecked.value = true;
    String input = inputController.text;

    if (input.isEmpty) {
      isValidInput.value = false;
      return;
    }

    double timeValue = double.tryParse(input) ?? 0.0;

    // Convert to seconds based on selected unit
    switch (selectedUnit.value) {
      case 'Years':
        timeInSeconds = timeValue * 31557600; // 1 Year = 365.25 days in seconds
        break;
      case 'Months':
        timeInSeconds = timeValue * 2629743; // 1 Month = 30.44 days in seconds
        break;
      case 'Weeks':
        timeInSeconds = timeValue * 604800; // 1 Week = 7 days in seconds
        break;
      case 'Days':
        timeInSeconds = timeValue * 86400; // 1 Day = 24 hours in seconds
        break;
      case 'Hours':
        timeInSeconds = timeValue * 3600; // 1 Hour = 60 minutes in seconds
        break;
      case 'Minutes':
        timeInSeconds = timeValue * 60; // 1 Minute = 60 seconds
        break;
      case 'Seconds':
        timeInSeconds = timeValue; // Already in seconds
        break;
      default:
        timeInSeconds = 0.0;
        break;
    }

    formatFullTime(timeInSeconds);
  }

  void formatFullTime(double secondsInput) {
    double seconds = secondsInput;

    timeInYears = seconds / 31557600; // 1 year in seconds (365.25 days)
    seconds %= 31557600;

    timeInMonths =
        seconds / 2629743; // Average month in seconds (30.44 days)
    seconds %= 2629743;

    timeInWeeks = seconds / 604800; // 1 week in seconds (7 days)
    seconds %= 604800;

    timeInDays = seconds / 86400; // 1 day in seconds (24 hours)
    seconds %= 86400;

    timeInHours = seconds / 3600; // 1 hour in seconds (60 minutes)
    seconds %= 3600;

    timeInMinutes = seconds / 60; // 1 minute in seconds
    timeInSeconds = seconds % 60; // Remaining seconds
  }
}
