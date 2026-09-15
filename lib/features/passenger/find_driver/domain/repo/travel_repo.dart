import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/features/passenger/find_driver/domain/entities/travel_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TravelRepo {
  Future<Either<Failure, TravelEntity>> getTravelInfo({
    required LatLng source,
    required LatLng destination,
  });
}
