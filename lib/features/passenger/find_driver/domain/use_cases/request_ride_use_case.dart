import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/passenger/find_driver/domain/repo/ride_repo.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<String, RideModel>> request({
    required String paymentMethod,
    required double latS,
    required double latD,
    required double lngS,
    required double lngD,
    required String driverUid,
    required String passengerUid,
  });
  Future<Either<String, RideModel>> get();
  void cancel();
}

class RequestRideUseCase extends UseCase {
  final RideRepo repo;

  RequestRideUseCase(this.repo);
  @override
  Future<Either<String, RideModel>> request({
    required String paymentMethod,
    required double latS,
    required double latD,
    required double lngS,
    required double lngD,
    required String driverUid,
    required String passengerUid,
  }) async {
    try {
      repo.requestDriver(
        paymentMethod: paymentMethod,
        latS: latS,
        latD: latD,
        lngS: lngS,
        lngD: lngD,
        driverUid: driverUid,
        passengerUid: passengerUid,
      );
      RideModel model = await repo.getRide();
      return right(model);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, RideModel>> get() async {
    try {
      RideModel model = await repo.getRide();
      return right(model);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  void cancel() {
    repo.updateRideStatus();
  }
}
