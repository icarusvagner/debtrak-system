import 'package:debtrak/core/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeMenuModel {
  final String label;
  final BalanceOptions opt;
  final Function(VoidCallback) callback;

  const HomeMenuModel({
    required this.label,
    required this.opt,
    required this.callback,
  });
}
