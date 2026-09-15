import 'package:car_rental/features/driver/home/data/models/ride_model/ride_model.dart';

abstract class RideStates {}

class InitialRideState extends RideStates {}

class LoadingGetRidesState extends RideStates {}

class SuccessGetRidesState extends RideStates {
  final RideModel model;
  SuccessGetRidesState(this.model);
}

class ErrorGetRidesState extends RideStates {
  final String message;

  ErrorGetRidesState(this.message);
}
