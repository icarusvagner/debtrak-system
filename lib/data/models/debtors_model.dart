import 'package:debtrak/core/utils/constants.dart';

class DebtorsModel {
  final String id;
  final String fullname;
  final int balanceDebt;
  final int totalDebt;
  final Status status;
  final String expectedEndDate;

  const DebtorsModel({
    required this.id,
    required this.fullname,
    required this.balanceDebt,
    required this.totalDebt,
    required this.status,
    required this.expectedEndDate,
  });
}
