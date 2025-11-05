import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DebtrakApp());
}

class DebtrakApp extends StatelessWidget {
  const DebtrakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(DebtrakColors().primary),
      title: "Debtrak",
      theme: ThemeData(primaryColor: Color(DebtrakColors().primary)),
      home: HomePage(),
    );
  }
}
