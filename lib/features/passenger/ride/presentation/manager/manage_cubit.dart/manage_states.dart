import 'package:car_rental/features/passenger/ride/data/models/manage_model/manage_model.dart';

abstract class ManageStates {}

class InitialManageState extends ManageStates {}

class LoadingManageState extends ManageStates {}

class ErrorManageState extends ManageStates {
  final String message;

  ErrorManageState(this.message);
}

class SuccessManageState extends ManageStates {
  final ManageModel model;

  SuccessManageState(this.model);
}
