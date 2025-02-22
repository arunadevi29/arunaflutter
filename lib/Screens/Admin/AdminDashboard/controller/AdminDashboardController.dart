import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/Admin_Dashboard_Screen.dart';

class AdminDashboardcontroller extends GetxController {
  int _currentIndex = 0;
  final List<Widget> _screens = [Admin_Dashboard()];

  void _onItemTapped(index) {
    _currentIndex = index;
  }

  PageController _myPage = PageController(initialPage: 0);
}
