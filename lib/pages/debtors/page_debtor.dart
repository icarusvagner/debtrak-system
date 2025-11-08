import 'package:flutter/material.dart';
import 'package:debtrak/pages/debtors/page_debtor_home.dart';
import 'package:debtrak/pages/debtors/page_new_debtor.dart';

class DebtorsPage extends StatelessWidget {
  final int? id;
  const DebtorsPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    if (id != 0 || id == null) {
      return DebtorsPageStateFul(key: key, id: id);
    } else {
      return NewDebtorStateful(key: key);
    }
  }
}
