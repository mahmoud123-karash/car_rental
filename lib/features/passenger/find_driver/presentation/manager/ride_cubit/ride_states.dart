import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';

abstract class RideStates {}

class InitialRideState extends RideStates {}

class LoadingRequestRideState extends RideStates {}

class ErrorRequestRideState extends RideStates {
  final String message;

  ErrorRequestRideState(this.message);
}

class SuccessRequestRideState extends RideStates {
  final RideModel model;

  SuccessRequestRideState(this.model);
}

class CancelRequestRideState extends RideStates {}
