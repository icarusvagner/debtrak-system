class BalanceModel {
  int? id;
  int amount;
  int? updatedAmount;
  int? status;
  DateTime createdAt;
  DateTime updatedAt;

  BalanceModel({
    this.id,
    this.status,
    this.updatedAmount,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'balance': amount,
      'updated_balance': amount,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      id: map['id'] as int?,
      status: map['status'] as int,
      amount: map['balance'] as int,
      updatedAmount: map['updated_balance'] as int,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }
}
