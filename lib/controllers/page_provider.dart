import 'package:flutter/material.dart';

class pageProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  navigateBottomBar(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
