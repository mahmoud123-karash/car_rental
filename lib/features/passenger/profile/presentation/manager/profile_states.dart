abstract class ProfileStates {}

class InitialProfileState extends ProfileStates {}

class LoadingUpdateProfileState extends ProfileStates {}

class SucessUpdateProfileState extends ProfileStates {}

class ErrroUpdateProfileState extends ProfileStates {
  final String message;

  ErrroUpdateProfileState(this.message);
}
