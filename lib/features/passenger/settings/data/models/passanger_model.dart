import 'package:hive_flutter/adapters.dart';
part 'passanger_model.g.dart';

@HiveType(typeId: 2)
class PassangerModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String phone;
  @HiveField(2)
  final String job;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String email;

  PassangerModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.job,
    required this.gender,
  });

  factory PassangerModel.fromJson(Map<String, dynamic> json) => PassangerModel(
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        job: json['job'] ?? '',
        gender: json['gender'] ?? '',
        email: json['email'] ?? '',
      );
}
