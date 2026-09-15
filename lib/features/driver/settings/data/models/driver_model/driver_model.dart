import 'package:car_rental/features/driver/settings/data/models/driver_model/car_model.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';

class DriverModel extends DriverEntity {
  double? lat;
  double? lng;
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? userType;
  bool? profileCompleted;
  bool? carCompleted;
  String? image;
  String? job;
  String? birth;
  String? gender;
  CarModel? car;

  DriverModel({
    this.lat,
    this.lng,
    this.image,
    this.job,
    this.birth,
    this.gender,
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.userType,
    this.carCompleted,
    this.profileCompleted,
    this.car,
  }) : super(
          driverName: name,
          driverBirth: birth,
          driverCar: car,
          deiverEmail: email,
          driverGender: gender,
          driverImage: image,
          driverJob: job,
          driverPhone: phone,
          completed: carCompleted,
        );

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        uid: json['uid'] ?? '',
        lat: json['lat'] ?? 0.0,
        lng: json['lng'] ?? 0.0,
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        userType: json['userType'] ?? '',
        carCompleted: json['carCompleted'] ?? false,
        profileCompleted: json['profileCompleted'] ?? false,
        image: json['image'] ?? '',
        job: json['job'] ?? '',
        birth: json['birth'] ?? '',
        gender: json['gender'] ?? '',
        car: json['car'] == null
            ? null
            : CarModel.fromJson(json['car'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'lat': lat,
        'lng': lng,
        'name': name,
        'email': email,
        'phone': phone,
        'userType': userType,
        'carCompleted': carCompleted,
        'profileCompleted': profileCompleted,
        'image': image,
        'job': job,
        'birth': birth,
        'gender': gender,
        'car': car!.toJson(),
      };
}
