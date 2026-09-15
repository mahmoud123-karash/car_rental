class PayModel {
  final String paymentMethod;
  final bool isPayed;

  PayModel({
    required this.paymentMethod,
    required this.isPayed,
  });

  factory PayModel.fromJson(Map<String, dynamic> json) => PayModel(
        paymentMethod: json['paymentMethod'] ?? "",
        isPayed: json['isPayed'] ?? false,
      );
}
