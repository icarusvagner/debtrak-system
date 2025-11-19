import 'package:flutter/material.dart';

enum LayoutType { homePage, debtorsPage, notesPage, historyPage }

Map<LayoutType, String> layoutNames = {
  LayoutType.homePage: "Home",
  LayoutType.debtorsPage: "Debtors",
  LayoutType.notesPage: "Notes",
  LayoutType.historyPage: "History",
};

class LayoutController extends ChangeNotifier {
  LayoutType _current = LayoutType.homePage;
  dynamic _args;

  int get currentIndex => _current.index;
  LayoutType get getCurrent => _current;
  dynamic get args => _args;

  void setLayout(LayoutType layout, {dynamic args}) {
    _current = layout;
    _args = args;
    notifyListeners();
  }
}

class LayoutConfig {
  final Widget Function(dynamic args) builder;

  const LayoutConfig({required this.builder});

  Widget build(dynamic args) => builder(args);
}
