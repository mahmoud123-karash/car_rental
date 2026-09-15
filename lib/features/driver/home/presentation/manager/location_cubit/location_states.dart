abstract class LoactionStates {}

class InitialLocationState extends LoactionStates {}

class LoadingGetLoactionState extends LoactionStates {}

class SucessGetLocationState extends LoactionStates {
  final double lat;
  final double lng;

  SucessGetLocationState(this.lat, this.lng);
}

class ErrorGetLoactionState extends LoactionStates {
  final String message;

  ErrorGetLoactionState(this.message);
}
