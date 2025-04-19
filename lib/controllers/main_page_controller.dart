import 'package:get/get.dart';
import 'package:tugas3_tpm/routes/route_name.dart';

class MainPageController {

  void goToStopwatchScreen() {
    Get.toNamed(RouteName.stopwatchScreen);
  }
  void goToTrackingScreen() {
    Get.toNamed(RouteName.trackingScreen);
  }
  void goToNumberTypesScreen() {
    Get.toNamed(RouteName.numberTypesScreen);
  }
  void goToTimeConverterScreen() {
    Get.toNamed(RouteName.timeConverterScreen);
  }
  void goToRecommendationScreen() {
    Get.toNamed(RouteName.recommendationScreen);
  }
}