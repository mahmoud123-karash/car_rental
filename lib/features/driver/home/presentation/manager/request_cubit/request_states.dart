import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';

abstract class RequestStates {}

class InitialRequestState extends RequestStates {}

class LoadingRequestState extends RequestStates {}

class SuccessRequestState extends RequestStates {
  final List<RequestModel> requests;
  SuccessRequestState(this.requests);
}

class ErrorRequestState extends RequestStates {
  final String message;

  ErrorRequestState(this.message);
}

class SuccessConfirmedRequestState extends RequestStates {
  final RequestModel model;

  SuccessConfirmedRequestState(this.model);
}
