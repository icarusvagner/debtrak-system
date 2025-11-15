import 'package:debtrak/core/migrations/balance.dart';
import 'package:debtrak/core/services/db_service.dart';

class BalanceTask {
  void addNewBalance(int balance) async {
    int newBal = balance;
    final instance = DatabaseService.instance;
    final db = await instance.database;

    await db.insert(balanceTableName, {"balance": newBal});
  }
}
