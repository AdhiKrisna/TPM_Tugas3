import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/stopwatch_controller.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StopwatchController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Obx(
            () => Column(
              mainAxisAlignment:
                  controller.isSaved.isTrue
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    controller.formattedTime,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                controller.isSaved.isFalse
                    ? SizedBox(height: 40)
                    : const SizedBox(height: 10),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: Obx(
                        () => IconButton(
                          icon:
                              controller.isRunning.isFalse
                                  ? Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 32,
                                  )
                                  : Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                          onPressed:
                              controller.isRunning.isFalse
                                  ? controller.start
                                  : controller.stop,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: controller.reset,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: controller.saveTime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                controller.isSaved.isTrue
                    ? Expanded(
                      child: ListView.builder(
                        itemExtent: 75,
                        shrinkWrap: true,
                        itemCount: controller.savedTimes.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(4),
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                controller.savedTimes.removeAt(index);
                                if (controller.savedTimes.isEmpty) {
                                  controller.isSaved.value = false;
                                }
                              },
                            ),
                            title: Text(
                              controller.savedTimes[index],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
