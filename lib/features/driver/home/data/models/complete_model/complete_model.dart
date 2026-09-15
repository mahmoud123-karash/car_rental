class CompelteModel {
  final bool profileComplete;
  final bool carComplete;

  CompelteModel({
    required this.profileComplete,
    required this.carComplete,
  });

  factory CompelteModel.fromJson(Map<String, dynamic> json) => CompelteModel(
        profileComplete: json['profileCompleted'] ?? false,
        carComplete: json['carCompleted'] ?? false,
      );
}
