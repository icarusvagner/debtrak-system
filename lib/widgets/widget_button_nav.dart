import 'package:debtrak/widgets/widget_animated_bar.dart';
import 'package:flutter/material.dart';

class ButtonNav extends StatelessWidget {
  final String title;
  final IconData icon;

  const ButtonNav({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetAnimatedBar(isActive: true),
        SizedBox(height: 36, width: 36, child: Icon(icon, size: 32)),
      ],
    );
  }
}
