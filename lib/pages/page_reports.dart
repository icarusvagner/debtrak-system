import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("This is the reports page"),
          OutlinedButton(
            child: Text("Total"),
            onPressed: () => setState(() => total += 1),
          ),
        ],
      ),
    );
  }
}
