import 'package:debtrak/core/utils/constants.dart';
import 'package:debtrak/data/models/home_menu_model.dart';

class HomeMenuData {
  final menus = [
    HomeMenuModel(
      label: "Update Balance",
      opt: BalanceOptions.updateBalance,
      callback: (cb) => cb,
    ),
    HomeMenuModel(
      label: "Reset Balance",
      opt: BalanceOptions.resetBalance,
      callback: (cb) => cb,
    ),
    HomeMenuModel(
      label: "View Balance",
      opt: BalanceOptions.showBalance,
      callback: (cb) => cb,
    ),
  ];
}
