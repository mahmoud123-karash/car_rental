import 'package:car_rental/features/driver/ride/data/models/pay_model.dart';

abstract class RideStates {}

class InitialRideState extends RideStates {}

class LoadingGetRideState extends RideStates {}

class SucessGetRideState extends RideStates {
  final PayModel model;

  SucessGetRideState(this.model);
}

class ErrorGetRideState extends RideStates {
  final String message;

  ErrorGetRideState(this.message);
}
