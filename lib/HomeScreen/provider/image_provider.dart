import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int imgindex = 0;

  List imgList = [
    "assets/images/n1.jpg",
    "assets/images/n2.jpg",
    "assets/images/n3.jpg",
    "assets/images/n4.jpg",
    "assets/images/n5.jpg",
    "assets/images/n6.jpg",
    "assets/images/n7.jpg",
    "assets/images/n8.jpg",
    "assets/images/n9.jpg",
    "assets/images/n10.jpg",
  ];

  void ChangeIndex(int index) {
    imgindex = index;
    notifyListeners();
  }
}
