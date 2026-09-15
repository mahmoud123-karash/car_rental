import 'package:car_rental/features/passenger/ride/domain/entities/time_entity.dart';

abstract class TimeStates {}

class InitialTimeState extends TimeStates {}

class LoadingGetTimeState extends TimeStates {}

class ErrorGetTimeState extends TimeStates {
  final String message;

  ErrorGetTimeState(this.message);
}

class SuceesGetTimeState extends TimeStates {
  final TimeEntity time;

  SuceesGetTimeState(this.time);
}
