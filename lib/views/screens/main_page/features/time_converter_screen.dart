import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/time_converter_controller.dart';
import 'package:tugas3_tpm/views/widgets/text_field_widget.dart';

class TimeConverterScreen extends StatelessWidget {
  TimeConverterScreen({super.key});
  final _controller = Get.find<TimeConverterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Time Converter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                controller: _controller.inputController,
                isNumber: true,
                hintText: "Input Time",
                prefixIcon: Icons.access_time,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),

                child: Center(
                  child: Obx(
                    () => DropdownButton<String>(
                      dropdownColor: Colors.blue,
                      disabledHint: const Text('Select Unit'),
                      value: _controller.selectedUnit.value,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 24,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      underline: const SizedBox(),
                      items:
                          _controller.timeUnits.map((String unit) {
                            return DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        _controller.selectedUnit.value = newValue!;
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.convertTime();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Convert Time',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(()=>
                _controller.isChecked.isTrue
                    ? Column(
                        children: [
                          if (_controller.isValidInput.isFalse) const Text(
                                  "Input tidak valid",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ) else Column(
                                  children: [
                                    Text(
                                      'Years: ${_controller.timeInYears.floor()}',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Months: ${_controller.timeInMonths.floor()}',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Weeks: ${_controller.timeInWeeks.floor()}',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Days: ${_controller.timeInDays.floor()}',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Hours: ${_controller.timeInHours.floor()}',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Minutes: ${_controller.timeInMinutes.floor()}',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Seconds: ${_controller.timeInSeconds.floor()}',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                        ],
                      )
                    : const SizedBox(),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
