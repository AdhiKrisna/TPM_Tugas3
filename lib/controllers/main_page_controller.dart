import 'package:get/get.dart';
import 'package:tugas3_tpm/routes/route_name.dart';

class MainPageController {

  void goToStopwatchPage() {
    Get.toNamed(RouteName.stopwatchPage);
  }
  void goToNumberTypesPage() {
    Get.toNamed(RouteName.numberTypesPage);
  }
  void goToTrackingPage() {
    Get.toNamed(RouteName.trackingPage);
  }
  void goToTimeConverterPage() {
    Get.toNamed(RouteName.timeConverterPage);
  }
  void goToRecommendationPage() {
    Get.toNamed(RouteName.recommendationPage);
  }
}