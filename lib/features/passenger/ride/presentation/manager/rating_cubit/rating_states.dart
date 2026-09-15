abstract class RatingStates {}

class InitialRatingState extends RatingStates {}

class LoadingUpdateRatingState extends RatingStates {}

class ErrorUpdateRatingState extends RatingStates {
  final String message;

  ErrorUpdateRatingState(this.message);
}

class SuceesUpdateRatingState extends RatingStates {}
