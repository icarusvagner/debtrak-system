import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:number_formatter2/number_formatter2.dart';

class HomePageBalanceCard extends StatelessWidget {
  final int amount;
  final IconData icon;
  final String label;
  final Color color;

  const HomePageBalanceCard({
    super.key,
    required this.amount,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.white,
          child: Icon(icon, size: 24, color: color),
        ),
        const SizedBox(width: 8.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(LucideIcons.philippinePeso, size: 18, color: Colors.white),
                Text(
                  NumberFormatter.format(amount),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              label,
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
