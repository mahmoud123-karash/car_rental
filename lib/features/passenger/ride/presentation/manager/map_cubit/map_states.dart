import 'package:car_rental/features/passenger/ride/data/models/location_model/driver_model.dart';

abstract class MapStates {}

class InitialMapState extends MapStates {}

class LoadingGetLocationState extends MapStates {}

class ErrorGetLocationState extends MapStates {
  final String message;

  ErrorGetLocationState(this.message);
}

class SuceesGetLocationState extends MapStates {
  final DriverModel model;

  SuceesGetLocationState(this.model);
}
