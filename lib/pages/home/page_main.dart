import 'package:debtrak/pages/home/page_main_view.dart';
import 'package:debtrak/pages/home/page_set_new_balance.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final int? canSetBalance;

  const MainPage({super.key, this.canSetBalance});

  @override
  Widget build(BuildContext context) {
    if (canSetBalance != 0 || canSetBalance == null) {
      return PageMainView();
    } else {
      return PageSetNewBalance();
    }
  }
}
