import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/core/utils/layout_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WidgetQuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final LayoutType goToLayout;
  final dynamic args;

  const WidgetQuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.goToLayout,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<LayoutController>(
        context,
        listen: false,
      ).setLayout(goToLayout, args: args),
      child: Container(
        width: 110,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            // Gradient Icon Bubble
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    DebtrakPalette.blue.strong,
                    DebtrakPalette.blue.deep,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: DebtrakPalette.blue.mid.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 26),
            ),

            const SizedBox(height: 10),

            // Label
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: const Color(0xFF2A2A2A),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
