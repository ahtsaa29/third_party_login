import 'package:flutter/material.dart';

class CountChanger with ChangeNotifier {
  int _itemCount = 0;

  int get itemCount => _itemCount;

  void incrementCount() {
    _itemCount++;

    notifyListeners();
  }

  void decrementCount() {
    if (_itemCount != 0) {
      _itemCount--;
      notifyListeners();
    }
  }
}
