import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_tpm/controllers/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  final mainScreenC = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          selectedItemColor: Colors.white ,
          unselectedItemColor: Colors.white,
          items: mainScreenC.items,
          currentIndex: mainScreenC.indexBottomNavbar.value,
          backgroundColor: Colors.blue,
          onTap: (index) {
            mainScreenC.changeIndexBottomNavbar(index);
            // Get.offNamed(mainScreenC.pages[index]);
          },
        ),
      ),
      body: Obx(  () => mainScreenC.pages[mainScreenC.indexBottomNavbar.value],
      ),
    );
  }
}