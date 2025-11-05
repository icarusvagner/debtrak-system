import 'package:debtrak/pages/home.dart';
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
      home: HomePage(),
      color: Colors.white,
      title: "Debtrak",
    );
  }
}
