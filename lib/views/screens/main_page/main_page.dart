import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas3_tpm/controllers/auth_controller.dart';
import 'package:tugas3_tpm/controllers/main_page_controller.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});
  final MainPageController _controller = MainPageController();
  Future<String> _getUsernameFromArgsOrPrefs(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final arg = Get.arguments;
    if (arg is String && arg.isNotEmpty) {
      return arg;
    } else {
      return prefs.getString('username') ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          (didPop, result) => {
            if (!didPop) {SystemNavigator.pop()},
          },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Konfirmasi Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      'Yakin ingin logout?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          authC.logout(context);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: FutureBuilder<String>(
          future: _getUsernameFromArgsOrPrefs(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            String username = snapshot.data ?? '';

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hai, $username',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 75,
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        spacing: 15,
                        children: [
                          Icon(Icons.timer, size: 24, color: Colors.white),
                          const Text(
                            'Stopwatch',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 75,
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        spacing: 15,
                        children: [
                          Icon(
                            Icons.format_list_numbered_sharp,
                            size: 24,
                            color: Colors.white,
                          ),
                          const Text(
                            'Number Types',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onPressed: () {
                        _controller.goToNumberTypesPage();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 75,
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        spacing: 15,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 24,
                            color: Colors.white,
                          ),
                          const Text(
                            'Tracking LBS',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 75,
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        spacing: 15,
                        children: [
                          Icon(
                            Icons.timer_10_outlined,
                            size: 24,
                            color: Colors.white,
                          ),
                          const Text(
                            'Time Converter',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 75,
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        spacing: 15,
                        children: [
                          Icon(Icons.newspaper, size: 24, color: Colors.white),
                          const Text(
                            'Recommendation',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void showSnackbar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
}
