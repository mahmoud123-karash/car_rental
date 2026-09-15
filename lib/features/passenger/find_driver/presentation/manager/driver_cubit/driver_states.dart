import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';

abstract class DriversStates {}

class InitialDriverState extends DriversStates {}

class LoadingGetDriversState extends DriversStates {}

class SuccessGetDriversState extends DriversStates {
  final List<DriverModel> list;

  SuccessGetDriversState(this.list);
}

class ErrorGetDriversState extends DriversStates {
  final String error;

  ErrorGetDriversState(this.error);
}
