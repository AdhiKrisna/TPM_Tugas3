import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NumberTypesController extends GetxController {
  TextEditingController numberController = TextEditingController();

  var isInteger = false.obs;
  var isPositive = false.obs;
  var isNegative = false.obs;
  var isDecimal = false.obs;
  var isNatural = false.obs; 
  var isPrimeNumber = false.obs;
  var isValidInput = true.obs;

  void checkNumberTypes() {
    final input = numberController.text;

    double? number = double.tryParse(input);

    if (number == null) {
      isValidInput.value = false;
      resetTypes();
      return;
    }

    isValidInput.value = true;

    // bil bulat (integer)
    isInteger.value = number % 1 == 0;

    // Positif / negatif
    isPositive.value = number > 0;
    isNegative.value = number < 0;

    // desimal
    isDecimal.value = number % 1 != 0;

    // cacah 
    isNatural.value = isInteger.value && number >= 0;

    // Prima
    isPrimeNumber.value = isPrime(number);
  }

  bool isPrime(double number) {
    if (number % 1 != 0 || number < 2) return false;

    int n = number.toInt();
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void resetTypes() {
    isInteger.value = false;
    isPositive.value = false;
    isNegative.value = false;
    isDecimal.value = false;
    isNatural.value = false;
    isPrimeNumber.value = false;
  }
}
