class HistoryModel {
  final String id;
  final int amountPaid;
  final String paymentMethod;
  final String dateSettled;
  final String referenceNo;
  final String debtor;
  final String description;

  const HistoryModel({
    required this.id,
    required this.amountPaid,
    required this.paymentMethod,
    required this.dateSettled,
    required this.referenceNo,
    required this.debtor,
    required this.description,
  });
}
