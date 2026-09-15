import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepo {
  Future<Either<String, PassangerModel>> getPassenger();
}
