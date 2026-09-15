import 'package:car_rental/features/passenger/find_driver/domain/entities/travel_entity.dart';

abstract class TravelStates {}

class InitialTravelState extends TravelStates {}

class LoadingGetTravelInfoState extends TravelStates {}

class ErrorGetTravelInfoState extends TravelStates {
  final String message;

  ErrorGetTravelInfoState(this.message);
}

class SuccessGEtTravelInfoState extends TravelStates {
  final TravelEntity model;

  SuccessGEtTravelInfoState(this.model);
}
