import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';

abstract class PassengerStates {}

class InitialPassengerState extends PassengerStates {}

class LoadingGetPassengerDataState extends PassengerStates {}

class SuccessGetPassengerDataState extends PassengerStates {
  final PassangerModel passenger;

  SuccessGetPassengerDataState(this.passenger);
}

class ErrorGetPassengerDataState extends PassengerStates {
  final String error;

  ErrorGetPassengerDataState(this.error);
}
