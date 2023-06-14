import 'package:flutter/material.dart';

class TabNavigationState extends ChangeNotifier {
  int _currentIndex = 0;

  void switchTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;
}
