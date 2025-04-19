import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/tracking_controller.dart';

class TrackingScreen extends StatelessWidget {
  TrackingScreen({super.key});
  final _controller = Get.find<TrackingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking Screen'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        return FlutterMap(
          options: MapOptions(
            initialCenter: _controller.userLocation.value,
            maxZoom: 22.0,
            minZoom: 2.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: _controller.userLocation.value,
                  width: 40,
                  height: 40,
                  rotate: true,

                  child: Transform.rotate(
                    angle: _controller.userHeading.value * (3.14 / 180),
                    child: const Icon(
                      Icons.navigation,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
