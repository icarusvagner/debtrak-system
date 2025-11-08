import 'package:debtrak/core/utils/layout_type.dart';
import 'package:flutter/material.dart';

class QuickActionModel {
  final IconData icon;
  final String label;
  final LayoutType goToLayout;
  final dynamic args;
  final Function(VoidCallback?)? callback;

  const QuickActionModel({
    required this.icon,
    required this.label,
    required this.goToLayout,
    this.args,
    this.callback,
  });
}
