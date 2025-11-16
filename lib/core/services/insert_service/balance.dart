import 'package:debtrak/core/migrations/balance.dart';
import 'package:debtrak/core/services/db_service.dart';
import 'package:debtrak/data/models/balance.dart';
import 'package:sqflite/sql.dart';

final String tableBal = "balance_tbl";
final String colId = 'id';
final String colBal = "balance";
final String colCreated = "created_at";
final String colUpdated = "updated_at";

class BalanceRepository {
  static final _instance = DatabaseService.instance;

  static insert(Balance bal) async {
    final db = await _instance.database;

    await db.insert(
      balanceTableName,
      bal.tomap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static getBalance() async {
    final db = await _instance.database;
  }
}
