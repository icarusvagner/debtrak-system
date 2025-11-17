import 'package:debtrak/core/migrations/debtors.dart';

const balanceTableName = "balance_tbl";

const String createBalanceTable =
    '''
   CREATE TABLE $balanceTableName (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       status INTEGER NOT NULL DEFAULT 0,
       balance INTEGER NOT NULL DEFAULT 0,
       updated_balance INTEGER NOT NULL DEFAULT 0,
       created_at TEXT,
       updated_at TEXT
   )
 ''';

const recordsBalanceTableName = "records_balance_tbl";
const String createRecordsBalanceTable =
    '''
    CREATE TABLE $recordsBalanceTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        balance_id INTEGER NOT NULL,   -- FK to update_balance.id
        debtor_id INTEGER NOT NULL,    -- FK to debtor.id
        deduction INT NOT NULL,     -- positive number, app decides meaning
        created_at TEXT,
        updated_at TEXT,
        FOREIGN KEY (balance_id) REFERENCES $balanceTableName(id) ON DELETE CASCADE,
        FOREIGN KEY (debtor_id) REFERENCES $debtorTableName(id) ON DELETE CASCADE
    );
''';
