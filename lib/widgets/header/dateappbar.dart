import 'package:debtrak/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateAppBar extends StatelessWidget {
  DateAppBar({super.key});

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 75,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5.0,
            children: [
              const Spacer(flex: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Constant().getWeekDay(now.weekday),
                    style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    Constant().getMonth(now.month),
                    style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              Text(
                now.day.toString(),
                style: GoogleFonts.inter(
                  color: Color(0xFF2A2A2A),
                  fontSize: 54,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
