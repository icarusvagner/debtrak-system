import 'package:debtrak/core/utils/layout_type.dart';
import 'package:debtrak/pages/page_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LayoutController(),
      child: const DebtrakApp(),
    ),
  );
}

class DebtrakApp extends StatelessWidget {
  const DebtrakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: "Debtrak",
      home: HomePage(),
    );
  }
}
