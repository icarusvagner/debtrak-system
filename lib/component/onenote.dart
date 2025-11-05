import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OneNote extends StatelessWidget {
  final String fullname;
  final String currentDebt;
  final String totalDebt;
  final String status;
  final String dateEnd;

  const OneNote({
    super.key,
    required this.fullname,
    required this.currentDebt,
    required this.totalDebt,
    required this.status,
    required this.dateEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFABABAB)),
          color: Color(0xFFF6F7F2),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullname,
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                color: Color(0xFF373737),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: Colors.black38),
            Row(
              children: [
                Text(
                  currentDebt,
                  style: GoogleFonts.roboto(
                    color: Color(0xFF4B4B4B),
                    fontSize: 54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "/",
                  style: GoogleFonts.roboto(
                    color: Color(0xFF4B4B4B),
                    fontSize: 54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  totalDebt,
                  style: GoogleFonts.roboto(
                    color: Color(0xFF4B4B4B),
                    fontSize: 54,
                    fontWeight: FontWeight.w400,
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
