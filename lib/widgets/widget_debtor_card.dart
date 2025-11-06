import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/core/utils/constants.dart';
import 'package:debtrak/core/utils/layout_type.dart';
import 'package:debtrak/widgets/widget_statusteller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_formatter2/number_formatter2.dart';
import 'package:provider/provider.dart';

class WidgetDebtorCard extends StatelessWidget {
  final String id;
  final String fullname;
  final int balanceDebt;
  final int totalDebt;
  final Status status;
  final String expectedEndDate;

  const WidgetDebtorCard({
    super.key,
    required this.id,
    required this.fullname,
    required this.balanceDebt,
    required this.totalDebt,
    required this.status,
    required this.expectedEndDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullname,
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(color: Colors.black38),
        Row(
          children: [
            Text(
              NumberFormatter.format(balanceDebt),
              style: GoogleFonts.roboto(
                color: Colors.black.withValues(alpha: 0.70),
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              "/",
              style: GoogleFonts.roboto(
                color: Colors.black.withValues(alpha: 0.70),
                fontSize: 45,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              NumberFormatter.format(totalDebt),
              style: GoogleFonts.roboto(
                color: Colors.black.withValues(alpha: 0.70),
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        StatusTeller(status: status),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Provider.of<LayoutController>(
                context,
                listen: false,
              ).setLayout(LayoutType.historyPage, args: id),
              child: Row(
                children: [
                  Text(
                    "Show history",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: DebtrakPalette.blue.mid,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Icon(
                    Icons.chevron_right_outlined,
                    size: 18.0,
                    color: DebtrakPalette.blue.strong,
                  ),
                ],
              ),
            ),
            Text(
              expectedEndDate,
              textAlign: TextAlign.right,
              style: GoogleFonts.inter(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
