import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/recommendation_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationScreen extends StatelessWidget {
  RecommendationScreen({super.key});
  final _controller = Get.find<RecommendationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _controller.codingSites.length,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            // Replace with your actual data model and properties
            final site = _controller.codingSites[index];
            return GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(site.siteUrl));
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 83, 83, 120),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 188, 192, 255),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          site.imagePath,
                          height: MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, size: 50);
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        site.siteName,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        site.description,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
