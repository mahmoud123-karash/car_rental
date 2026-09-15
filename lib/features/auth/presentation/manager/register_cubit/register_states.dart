abstract class RegisterStates {}

class InitialRegistertate extends RegisterStates {}

class LoadingRegistertate extends RegisterStates {}

class SuccessRegistertate extends RegisterStates {}

class ErrorRegistertate extends RegisterStates {
  final String error;

  ErrorRegistertate(this.error);
}
