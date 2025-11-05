import 'package:debtrak/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(15.0)),
          color: Color(DebtrakColors().accent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Bal"),
                Text(
                  "6,700",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Total", textAlign: TextAlign.start),
                Text(
                  "10,700",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
