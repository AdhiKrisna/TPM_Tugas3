import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas3_tpm/routes/route_name.dart';
import 'package:tugas3_tpm/routes/route_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final bool isLoggedIn = snapshot.data ?? false;
        return GetMaterialApp(
          title: 'Tugas 3 TPM',
          initialRoute: isLoggedIn ? RouteName.mainScreen : RouteName.login,
          getPages: RoutePages().routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
