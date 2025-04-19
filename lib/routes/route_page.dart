import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/number_types_controller.dart';
import 'package:tugas3_tpm/controllers/stopwatch_controller.dart';
import 'package:tugas3_tpm/controllers/time_converter_controller.dart';
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
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    
    // main page features
    GetPage(
      name: RouteName.stopwatchPage,
      page: () => StopwatchScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => StopwatchController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.numberTypesPage,
      page: () => NumberTypesScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => NumberTypesController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.trackingPage,
      page: () => TrackingScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.timeConverterPage,
      page: () =>  TimeConverterScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => TimeConverterController());
      }),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.recommendationPage,
      page: () => const RecommendationScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    
  ];
}
