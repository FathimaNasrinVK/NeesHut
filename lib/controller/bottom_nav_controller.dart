import 'package:newsapp/view/home_screeen.dart';
import 'package:flutter/material.dart';

import '../view/Category_screeeen/categryyyscreen.dart';
import '../view/seach_screeeeen/searchscreeen.dart';
// class BottomNavController extends ChangeNotifier {
//   int _selectedIndex = 0;
//
//   int get selectedIndex => _selectedIndex;
//
//   void setSelectedIndex( index) {
//     _selectedIndex = index;
//     notifyListeners();
//   }


class BottomNavController with ChangeNotifier {
  int selectedIndex = 1;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    Home(),
    CategoryScreen(),
    SearchScreen()
  ];

}