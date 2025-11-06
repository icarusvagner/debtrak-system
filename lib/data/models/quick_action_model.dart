import 'package:debtrak/core/utils/layout_type.dart';
import 'package:flutter/material.dart';

class QuickActionModel {
  final IconData icon;
  final String label;
  final LayoutType goToLayout;

  const QuickActionModel({
    required this.icon,
    required this.label,
    required this.goToLayout,
  });
}
