import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/number_types_controller.dart';
import 'package:tugas3_tpm/views/widgets/text_field_widget.dart';

class NumberTypesScreen extends StatelessWidget {
  NumberTypesScreen({super.key});
  final  _controller = Get.find<NumberTypesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Number Types'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                isNumber: true,
                controller: _controller.inputController,
                hintText: "Input Number",
                prefixIcon: Icons.onetwothree,
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.checkNumberTypes();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Check Number Type',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () =>
                    _controller.isChecked.value
                        ? Column(
                          children: [
                            _controller.isValidInput.isFalse
                                ? const Text(
                                  "Input tidak valid",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                : Column(
                                  children: [
                                    _controller.isInteger.value && _controller.isPositive.value
                                        ? const Text(
                                          "Bilangan Bulat Positif",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                        : _controller.isInteger.value &&  _controller.isNegative.value
                                        ? const Text(
                                          "Bilangan Bulat Negatif",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                        : SizedBox(),
                                    _controller.isDecimal.value
                                        ? Text(
                                          "Bilangan Desimal",
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                        : SizedBox(),
                                    _controller.isNatural.value
                                        ? const Text(
                                          "Bilangan Cacah",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                        : SizedBox(),
                                    _controller.isPrimeNumber.value
                                        ? const Text(
                                          "Bilangan Prima",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                        : SizedBox(),
                                  ],
                                ),
                          ],
                        )
                        : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
