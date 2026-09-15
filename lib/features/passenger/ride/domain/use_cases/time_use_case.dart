import 'package:car_rental/features/passenger/ride/domain/entities/time_entity.dart';
import 'package:car_rental/features/passenger/ride/domain/repo/location_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

import '../../data/models/location_model/driver_model.dart';

abstract class UseCase {
  Future<Either<String, TimeEntity>> get({
    required String uid,
    required LatLng source,
  });
}

class TimeUseCase extends UseCase {
  final LocationRepo locationRepo;

  TimeUseCase(this.locationRepo);
  @override
  Future<Either<String, TimeEntity>> get({
    required String uid,
    required LatLng source,
  }) async {
    try {
      DriverModel location = await locationRepo.getLocation(uid: uid);
      TimeEntity time = await locationRepo.getTime(
        source: LatLng(location.lat, location.lng),
        destination: source,
      );

      return right(time);
    } catch (e) {
      return left(e.toString());
    }
  }
}
