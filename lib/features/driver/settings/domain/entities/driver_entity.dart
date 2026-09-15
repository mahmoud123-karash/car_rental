import 'package:hive_flutter/adapters.dart';

import '../../data/models/driver_model/car_model.dart';

part 'driver_entity.g.dart';

@HiveType(typeId: 0)
class DriverEntity {
  @HiveField(0)
  String? driverName;
  @HiveField(1)
  String? deiverEmail;
  @HiveField(2)
  String? driverPhone;
  @HiveField(3)
  String? driverImage;
  @HiveField(4)
  String? driverJob;
  @HiveField(5)
  String? driverBirth;
  @HiveField(6)
  String? driverGender;
  @HiveField(7)
  CarModel? driverCar;
  @HiveField(8)
  bool? completed;

  DriverEntity({
    this.driverImage,
    this.driverJob,
    this.driverBirth,
    this.driverGender,
    this.driverName,
    this.deiverEmail,
    this.driverPhone,
    this.driverCar,
    this.completed,
  });
}
