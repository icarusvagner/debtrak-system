import 'package:debtrak/core/migrations/debtors.dart';

const balanceTableName = "balance_tbl";

const String createBalanceTable =
    '''
   CREATE TABLE $balanceTableName (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       balance INTEGER NOT NULL DEFAULT 0,
       created_at INTEGER DEFAULT (strftime('%s', 'now'))
       updated_at INTEGER DEFAULT (strftime('%s', 'now'))
   )
 ''';

const updateBalanceTableName = "update_balance_tbl";
const String createUpdatedBalanceTable =
    '''
  CREATE TABLE $updateBalanceTableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      balance_id INTEGER NOT NULL,
      deduction REAL NOT NULL,     -- positive number, app decides meaning
      created_time INTEGER DEFAULT (strftime('%s', 'now')),
      updated_time INTEGER DEFAULT (strftime('%s', 'now')),
      FOREIGN KEY (balance_id) REFERENCES $balanceTableName(id) ON DELETE CASCADE
  )
''';

const recordsBalanceTableName = "records_balance_tbl";
const String createRecordsBalanceTable =
    '''
    CREATE TABLE $recordsBalanceTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        updated_id INTEGER NOT NULL,   -- FK to update_balance.id
        debtor_id INTEGER NOT NULL,    -- FK to debtor.id
        created_time INTEGER DEFAULT (strftime('%s', 'now')),
        updated_time INTEGER DEFAULT (strftime('%s', 'now')),
        FOREIGN KEY (updated_id) REFERENCES $updateBalanceTableName(id) ON DELETE CASCADE,
        FOREIGN KEY (debtor_id) REFERENCES $debtorTableName(id) ON DELETE CASCADE
    );
''';
