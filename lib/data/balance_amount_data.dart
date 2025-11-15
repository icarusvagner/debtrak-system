import 'package:debtrak/data/models/balance_amount_model.dart';

int _cbAmount(int amount) {
  return amount;
}

class BalanceAmountData {
  final amounts = [
    BalanceAmountModel(label: 1000, onTap: () => _cbAmount(1000)),
    BalanceAmountModel(label: 3500, onTap: () => _cbAmount(3500)),
    BalanceAmountModel(label: 5000, onTap: () => _cbAmount(3500)),
    BalanceAmountModel(label: 7500, onTap: () => _cbAmount(7500)),
    BalanceAmountModel(label: 9200, onTap: () => _cbAmount(9200)),
    BalanceAmountModel(label: 10000, onTap: () => _cbAmount(10000)),
    BalanceAmountModel(label: 18000, onTap: () => _cbAmount(18000)),
    BalanceAmountModel(label: 22000, onTap: () => _cbAmount(22000)),
    BalanceAmountModel(label: 55000, onTap: () => _cbAmount(55000)),
    BalanceAmountModel(label: 99999, onTap: () => _cbAmount(99999)),
  ];
}
