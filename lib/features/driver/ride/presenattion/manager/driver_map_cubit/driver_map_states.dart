abstract class DriverMapStates {}

class InitialLocationState extends DriverMapStates {}

class LoadingGetLoactionState extends DriverMapStates {}

class SucessGetLocationState extends DriverMapStates {}

class ErrorGetLoactionState extends DriverMapStates {
  final String message;

  ErrorGetLoactionState(this.message);
}
