import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepo {
  Future<Either<String, DriverEntity>> getDriverData();
}
