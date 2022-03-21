import 'package:flutter/material.dart';

class YlVerticalTabsController extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set index(int value) {
    _changeIndex(value);
  }

  _changeIndex(int index) {
    _index = index;
    notifyListeners();
  }

  YlVerticalTabsController({int? index}) {
    _index = index ?? 0;
  }
}
