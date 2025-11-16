import 'package:debtrak/core/migrations/balance.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath, "debtrak_db.db");

    final database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(createBalanceTable);
        db.execute(createRecordsBalanceTable);
      },
    );

    return database;
  }
}
