import 'package:flutter/material.dart';

enum Status { active, pastDue, overDue }

class StatusTeller extends StatelessWidget {
  final Status status;
  const StatusTeller({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
