import 'package:flutter/material.dart';

enum HistoryLayoutType { allHistory, singleHistory, filteredHistory }

class HistoryLayoutTypeController extends ChangeNotifier {
  HistoryLayoutType current = HistoryLayoutType.allHistory;

  void setHistoryLayout(HistoryLayoutType layout) {
    current = layout;

    notifyListeners();
  }
}
