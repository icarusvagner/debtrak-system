import 'package:debtrak/widgets/onenote.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

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
            status: "Active",
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
