import 'package:flutter/material.dart';

class NumberTypesScreen extends StatelessWidget {
  const NumberTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Types'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Number Types',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the number types screen
              },
              child: const Text('Check Number Types'),
            ),
          ],
        ),
      ),
    );
  }
}