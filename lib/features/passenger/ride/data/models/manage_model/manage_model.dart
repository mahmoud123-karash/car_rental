class ManageModel {
  final String rideStatus;
  final bool isArrived;

  ManageModel({
    required this.rideStatus,
    required this.isArrived,
  });

  factory ManageModel.fromJson(Map<String, dynamic> json) => ManageModel(
        isArrived: json['isArrived'] ?? false,
        rideStatus: json['rideStatus'] ?? '',
      );
}
