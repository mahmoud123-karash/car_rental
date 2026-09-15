abstract class UpdateStates {}

class InitialUpdateState extends UpdateStates {}

class LoadingUpdateState extends UpdateStates {}

class SuccessUpdateState extends UpdateStates {}

class ErrorUpdateState extends UpdateStates {
  final String error;

  ErrorUpdateState(this.error);
}
