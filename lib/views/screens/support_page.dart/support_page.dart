import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Guide'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '📘 Application User Guide',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Text(
              '🔐 1. Login',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '- Enter your email and password to log in.\n'
              '- Your session will remain active until you log out.',
            ),
            SizedBox(height: 16),

            Text(
              '🏠 2. Home Page',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'This is the main page of the application.\n'
              'This page have a navigation bar at the bottom with an icon to navigate to the logout action.\n'
              'This page contains 5 main features displayed vertically:\n'
              '1. Stopwatch: Count up time with start and gonna be pause button when it started, reset button, and save button.\n'
              '2. Number Types: Display various number types like prime, decimal, integers (positive/negative), and whole numbers.\n'
              '3. Location Tracking: Shows your current location in real-time.\n'
              '4. Time Converter: Convert years to hours, minutes, and seconds.\n'
              '5. Recommended Sites: Shows websites with image, link, and favorite button.',
            ),
            SizedBox(height: 16),

            Text(
              '📲 3. Bottom Navigation Bar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '- 🏠 Home: Main features.\n'
              '- 👥 Members: Displays team member names and student IDs.\n'
              '- ❓ Help: Opens this guide.\n'
            ),
            SizedBox(height: 16),

            Text(
              '🧠 Tips',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '- Make sure to allow location access for tracking features.\n'
              '- Use portrait mode for the best experience.\n'
              '- Save your favorite sites for quick access later.',
            ),
          ],
        ),
      ),
    );
  }
}
