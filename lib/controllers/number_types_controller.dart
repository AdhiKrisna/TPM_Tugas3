import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NumberTypesController extends GetxController {
  TextEditingController inputController = TextEditingController();
  RxBool isChecked = false.obs;


  RxBool isInteger = false.obs;
  RxBool isPositive = false.obs;
  RxBool isNegative = false.obs;
  RxBool isDecimal = false.obs;
  RxBool isNatural = false.obs; 
  RxBool isPrimeNumber = false.obs;
  RxBool isValidInput = true.obs;

  void checkNumberTypes() {
    final String input = inputController.text;
    isChecked.value = true;
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
