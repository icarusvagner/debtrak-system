import 'package:debtrak/core/utils/colors.dart';
import 'package:flutter/material.dart';

class WidgetPageHeader extends StatelessWidget {
  final double? height;
  const WidgetPageHeader({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [DebtrakPalette.blue.deep, DebtrakPalette.blue.dark],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
