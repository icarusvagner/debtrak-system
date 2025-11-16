final String tableBal = "balance_tbl";
final String colId = 'id';
final String colBal = "balance";
final String colCreated = "created_at";
final String colUpdated = "updated_at";

class Balance {
  int? id;
  int? balance;
  String? createdAt;
  String? updatedAt;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{colBal: balance};

    if (id != null) {
      map[colId] = id;
    }
    return map;
  }

  Balance();

  Balance.fromMap(Map<String, Object?> map) {
    id = map[colId];
    balance = map[colBal];
    createdAt = map[colCreated];
    updatedAt = map[colUpdated];
  }
}
