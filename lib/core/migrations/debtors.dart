const String debtorTableName = "debtor_tbl";
const String createDebtorTable =
    '''
  CREATE TABLE $debtorTableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    email TEXT,
    amount REAL NOT NULL,
    date_released INTEGER,       -- Timestamp
    settled_date INTEGER,        -- Timestamp
    created_at TEXT,
    updated_at TEXT
  )
''';
