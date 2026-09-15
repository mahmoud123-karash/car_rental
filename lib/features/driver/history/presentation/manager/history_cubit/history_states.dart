import 'package:car_rental/features/driver/history/data/models/history_model.dart';

abstract class HistoryStates {}

class InitialHistorytate extends HistoryStates {}

class LoadingGetHistoryState extends HistoryStates {}

class SuccessGetHistoryState extends HistoryStates {
  final List<HistoryModel> list;
  SuccessGetHistoryState(this.list);
}

class ErrorGetHistoryState extends HistoryStates {
  final String message;

  ErrorGetHistoryState(this.message);
}
