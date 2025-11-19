import 'package:debtrak/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetDebtorReports extends StatelessWidget {
  final Color color;
  final String title;
  final int count;
  final IconData icon;

  const WidgetDebtorReports({
    super.key,
    required this.color,
    required this.title,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),

          const SizedBox(height: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.grey.withValues(alpha: 0.10),
                ),
                child: Icon(
                  icon,
                  color: color.withValues(alpha: 0.90),
                  size: 26,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                count.toString(),
                textAlign: TextAlign.left,
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
