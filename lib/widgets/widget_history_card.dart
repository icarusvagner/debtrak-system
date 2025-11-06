import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_formatter2/number_formatter2.dart';

class WidgetHistoryCard extends StatelessWidget {
  final String id;
  final int amountPaid;
  final String paymentMethod;
  final String dateSettled;
  final String referenceNo;
  final String debtor;
  final String description;

  const WidgetHistoryCard({
    super.key,
    required this.id,
    required this.amountPaid,
    required this.paymentMethod,
    required this.dateSettled,
    required this.referenceNo,
    required this.debtor,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  debtor,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  dateSettled,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Text(
              NumberFormatter.format(amountPaid),
              textAlign: TextAlign.right,
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
