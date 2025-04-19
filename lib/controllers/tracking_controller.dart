import 'dart:developer';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class TrackingController extends GetxController {
  late Location location = Location();
  Rx<double> userHeading = Rx<double>(0.0);
  Rx<LatLng> userLocation = LatLng(-7.784400383966617, 110.4030054821096).obs; 

   @override
  void onInit() {
    super.onInit();
    location = Location();
    fetchUserLocation();
  }
  Future<void> fetchUserLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    try {
      // Periksa apakah layanan lokasi aktif
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw Exception("Location service is disabled.");
        }
      }

      // Periksa apakah izin lokasi sudah diberikan
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw Exception("Location permission is denied.");
        }
      }

      // Ambil lokasi saat ini
      locationData = await location.getLocation();
      userLocation.value = LatLng(locationData.latitude!, locationData.longitude!);
      userHeading.value = locationData.heading ?? 0.0;

       // Dengarkan perubahan lokasi dan arah kompas secara real-time
      location.onLocationChanged.listen((LocationData currentLocation) {
        userLocation.value = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        userHeading.value = currentLocation.heading ?? 0.0; // Arah kompas (dalam derajat)
      });

      log("User location: ${userLocation.value.latitude}, ${userLocation.value.longitude}");
      log("User heading: ${userHeading.value}");
    } catch (e) {
      log("Error fetching user location: $e");
      userLocation.value =  const LatLng(-7.784400383966617, 110.4030054821096); // Lokasi default
    }
  }


}
