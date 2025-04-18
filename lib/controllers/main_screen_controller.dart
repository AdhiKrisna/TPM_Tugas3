import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas3_tpm/views/screens/members_page/members_page.dart';
import 'package:tugas3_tpm/views/screens/main_page/main_page.dart';
import 'package:tugas3_tpm/views/screens/support_page.dart/support_page.dart';

class MainScreenController extends GetxController {
  final RxInt _indexBottomNavbar = 0.obs;
  RxInt get indexBottomNavbar => _indexBottomNavbar;
  void changeIndexBottomNavbar(int index) {
    _indexBottomNavbar.value = index;
  }

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: 'Main Page'
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.people),
      label: 'Members'
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.support),
      label: 'Support'
    ),
  ];

  List<Widget> pages = [];

  @override
  void onInit() {
    super.onInit();
    pages = [
      MainPage(),
      MembersPage(),
      SupportPage(),
    ];
  }
}