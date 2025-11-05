import 'package:debtrak/core/utils/constants.dart';
import 'package:debtrak/pages/history_page.dart';
import 'package:debtrak/widgets/statusteller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OneNote extends StatelessWidget {
  final String fullname;
  final String currentDebt;
  final String totalDebt;
  final Status status;
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
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "/",
                  style: GoogleFonts.roboto(
                    color: Color(0xFF4B4B4B),
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  totalDebt,
                  style: GoogleFonts.roboto(
                    color: Color(0xFF4B4B4B),
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            StatusTeller(status: status),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(),
                    ), // Material App Router
                  ),
                  child: Row(
                    spacing: 15.0,
                    children: [
                      Text("Show history", textAlign: TextAlign.left),
                      Icon(Icons.chevron_right_outlined),
                    ],
                  ),
                ),
                OverflowBar(
                  spacing: 5.0,
                  overflowAlignment: OverflowBarAlignment.start,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Color(0xFF5FA8D3),
                        padding: EdgeInsets.symmetric(
                          vertical: 2.5,
                          horizontal: 5.0,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        spacing: 5.0,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Show history", textAlign: TextAlign.center),
                          Icon(Icons.chevron_right_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  dateEnd,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.inter(
                    color: Color(0xFF4B4B4B),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
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
