import 'package:car_rental/features/driver/home/data/models/complete_model/complete_model.dart';

abstract class CompleteStates {}

class InitialCompleteState extends CompleteStates {}

class LoadingGetDataState extends CompleteStates {}

class SuccessGetDataState extends CompleteStates {
  final CompelteModel model;

  SuccessGetDataState(this.model);
}

class ErrorGetDataState extends CompleteStates {
  final String message;

  ErrorGetDataState(this.message);
}
