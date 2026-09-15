import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';

abstract class RideRepo {
  void requestDriver({
    required String paymentMethod,
    required double latS,
    required double latD,
    required double lngS,
    required double lngD,
    required String driverUid,
    required String passengerUid,
  });
  void updateRideStatus();
  Future<RideModel> getRide();
}
