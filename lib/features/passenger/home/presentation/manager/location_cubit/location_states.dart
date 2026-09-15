import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationStates {}

class InitialLocatonState extends LocationStates {}

class LocatonChangedLoadingState extends LocationStates {}

class LocatonChangedSuccessState extends LocationStates {
  final LatLng myLocation;

  LocatonChangedSuccessState(this.myLocation);
}

class LocatonChangedErrorState extends LocationStates {
  final String message;

  LocatonChangedErrorState(this.message);
}
