import 'package:debtrak/core/utils/constants.dart';
import 'package:debtrak/widgets/onenote.dart';
import 'package:flutter/material.dart';

class DebtorsPage extends StatelessWidget {
  const DebtorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (c, i) => OneNote(
            fullname: "Lance Phillip",
            currentDebt: "6,000",
            totalDebt: "10,000",
            status: Status.active,
            dateEnd: "Dec 22, 2025",
          ),
          itemCount: 20,
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        tooltip: "Add new note",
        onPressed: () {
          print("Clicked");
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}
