import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:dartz/dartz.dart';

abstract class DriverRepo {
  Future<Either<String, List<DriverModel>>> getDrivers();
}
