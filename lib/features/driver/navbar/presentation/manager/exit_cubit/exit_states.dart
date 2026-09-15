abstract class ExitStates {}

class InitialExitState extends ExitStates {}

class LoadingExitState extends ExitStates {}

class SuccessExitState extends ExitStates {}

class ErroExitState extends ExitStates {
  final String error;

  ErroExitState(this.error);
}
