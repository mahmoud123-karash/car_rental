class UpdateModel {
  final String name;
  final String phone;
  final String job;
  final String gender;

  UpdateModel({
    required this.name,
    required this.phone,
    required this.job,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'job': job,
        'gender': gender,
      };
}
