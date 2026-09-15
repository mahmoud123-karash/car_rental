import 'package:car_rental/features/driver/ride/data/models/passenger_model.dart';

abstract class PassengerStates {}

class InitialPassengerState extends PassengerStates {}

class LoadingGetPassengerState extends PassengerStates {}

class SucessGetPassengerState extends PassengerStates {
  final PassengerModel model;

  SucessGetPassengerState(this.model);
}

class ErrorGetPassengerState extends PassengerStates {
  final String message;

  ErrorGetPassengerState(this.message);
}
