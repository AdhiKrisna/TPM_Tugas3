import 'package:get/get.dart';
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
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),

    
    // main page features
    GetPage(
      name: RouteName.stopwatchPage,
      page: () => StopwatchScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.numberTypesPage,
      page: () => NumberTypesScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.trackingPage,
      page: () => TrackingScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.timeConverterPage,
      page: () => const TimeConverterScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.recommendationPage,
      page: () => const RecommendationScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    
  ];
}
