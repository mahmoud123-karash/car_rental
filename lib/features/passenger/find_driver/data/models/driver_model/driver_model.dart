import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/car_model.dart';

class DriverModel {
  double? lat;
  double? lng;
  num? heading;
  String? uid;
  String? name;
  String? phone;
  String? image;
  bool? online;
  List<num>? rating;
  CarModel? car;

  DriverModel({
    this.lat,
    this.lng,
    this.image,
    this.online,
    this.uid,
    this.name,
    this.phone,
    this.rating,
    this.car,
    this.heading,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        uid: json['uid'] ?? '',
        lat: json['lat'] ?? 0.0,
        lng: json['lng'] ?? 0.0,
        heading: json['heading'] ?? 0.0,
        name: json['name'] ?? '',
        online: json['online'] ?? false,
        phone: json['phone'] ?? '',
        image: json['image'] ?? '',
        rating: List<num>.from(json['rating'] ?? []),
        car: json['car'] == null
            ? null
            : CarModel.fromJson(json['car'] as Map<String, dynamic>),
      );
}
