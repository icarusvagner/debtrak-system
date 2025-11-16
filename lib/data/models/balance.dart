class Balance {
  int? id;
  int amount;
  DateTime createdAt;
  DateTime updatedAt;

  Balance({
    this.id,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> tomap() {
    return {
      'balance': amount,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
