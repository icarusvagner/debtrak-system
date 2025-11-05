import 'package:debtrak/features/dashboard/balance.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [BalanceView()]));
  }
}
