import 'package:debtrak/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusTeller extends StatelessWidget {
  final Status status;
  const StatusTeller({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.0,
      children: [
        CircleAvatar(radius: 6.0, backgroundColor: statusColor[status]!),
        Text(
          statusNames[status]!,
          textAlign: TextAlign.start,
          style: GoogleFonts.roboto(
            color: statusColor[status]!,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
