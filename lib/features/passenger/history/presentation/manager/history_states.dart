import 'package:car_rental/features/passenger/history/data/models/history_model.dart';

abstract class HistoryStates {}

class InitialHistoryState extends HistoryStates {}

class LoadingGetHistoryState extends HistoryStates {}

class ErrorGetHistoryState extends HistoryStates {
  final String message;

  ErrorGetHistoryState(this.message);
}

class SuccessGetHistoryState extends HistoryStates {
  final List<HistoryModel> history;

  SuccessGetHistoryState(this.history);
}
