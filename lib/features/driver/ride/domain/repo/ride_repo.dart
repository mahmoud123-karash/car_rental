import 'package:car_rental/features/driver/ride/data/models/passenger_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/pay_model.dart';

abstract class RideRepo {
  Future<Either<String, PassengerModel>> getPassenger({
    required String uid,
  });

  Future<Either<String, PayModel>> getRide({
    required String uid,
  });

  void updateRide({
    required String uid,
  });
}
