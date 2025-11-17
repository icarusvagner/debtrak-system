import 'package:debtrak/core/migrations/balance.dart';
import 'package:debtrak/core/services/db_service.dart';
import 'package:debtrak/data/models/balance.dart';
import 'package:sqflite/sql.dart';

final String tableBal = "balance_tbl";
final String colId = 'id';
final String colBal = "balance";
final String colStatus = "status";
final String colUpdatedBalance = "updated_balance";
final String colCreated = "created_at";
final String colUpdated = "updated_at";

class BalanceRepository {
  static final _instance = DatabaseService.instance;

  static insert(BalanceModel bal) async {
    final db = await _instance.database;

    await db.update(
      balanceTableName,
      {colStatus: 1, colUpdated: DateTime.now().toIso8601String()},
      where: '$colStatus = ?',
      whereArgs: [0],
    );

    return await db.insert(
      balanceTableName,
      bal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateBalance(int updatedBalance) async {
    final db = await _instance.database;

    return await db.rawUpdate(
      '''
        UPDATE $balanceTableName
        SET $colUpdatedBalance = $colUpdatedBalance + ?,
          $colUpdated = ?
        WHERE $colStatus = 0
      ''',
      [updatedBalance, DateTime.now().toIso8601String()],
    );
  }

  static Future<BalanceModel?> getUpdatedBalance() async {
    final db = await _instance.database;
    final result = await db.query(
      balanceTableName,
      columns: [
        'id',
        'status',
        'balance',
        'updated_balance',
        'created_at',
        'updated_at',
      ],
      where: 'status = ?',
      whereArgs: [0],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return BalanceModel.fromMap(result.first);
    }

    return null;
  }
}
