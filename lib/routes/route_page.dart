import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/auth_controller.dart';
import 'package:tugas3_tpm/controllers/main_screen_controller.dart';
import 'package:tugas3_tpm/controllers/number_types_controller.dart';
import 'package:tugas3_tpm/controllers/recommendation_controller.dart';
import 'package:tugas3_tpm/controllers/stopwatch_controller.dart';
import 'package:tugas3_tpm/controllers/time_converter_controller.dart';
import 'package:tugas3_tpm/controllers/tracking_controller.dart';
import 'package:tugas3_tpm/routes/route_name.dart';
import 'package:tugas3_tpm/views/screens/login_screen.dart';
import 'package:tugas3_tpm/views/screens/main_page/features/number_types_screen.dart';
import 'package:tugas3_tpm/views/screens/main_page/features/recommendation_screen.dart';
import 'package:tugas3_tpm/views/screens/main_page/features/stopwatch_screen.dart';
import 'package:tugas3_tpm/views/screens/main_page/features/time_converter_screen.dart';
import 'package:tugas3_tpm/views/screens/main_page/features/tracking_screen.dart';
import 'package:tugas3_tpm/views/screens/main_screen.dart';


class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainScreenController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    
    // main page features
    GetPage(
      name: RouteName.stopwatchScreen,
      page: () => StopwatchScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => StopwatchController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.numberTypesScreen,
      page: () => NumberTypesScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => NumberTypesController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.trackingScreen,
      page: () => TrackingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => TrackingController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.timeConverterScreen,
      page: () =>  TimeConverterScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => TimeConverterController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.recommendationScreen,
      page: () =>  RecommendationScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RecommendationController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    
  ];
}
