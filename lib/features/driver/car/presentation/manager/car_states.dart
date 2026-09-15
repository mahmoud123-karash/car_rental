abstract class CarStates {}

class InitialCarState extends CarStates {}

class LoadingUpdteCarDataState extends CarStates {}

class SuccessUpdteCarDataState extends CarStates {}

class ErrorUpdteCarDataCarState extends CarStates {
  final String message;

  ErrorUpdteCarDataCarState(this.message);
}
