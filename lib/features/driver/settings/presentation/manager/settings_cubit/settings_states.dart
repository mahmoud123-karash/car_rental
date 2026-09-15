import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';

abstract class SettingsStates {}

class InitialSettingsState extends SettingsStates {}

class LoadingGetProfileDataState extends SettingsStates {}

class SuccessGetProfileDataState extends SettingsStates {
  final DriverEntity driver;

  SuccessGetProfileDataState(this.driver);
}

class ErrorGetProfileDataState extends SettingsStates {
  final String message;

  ErrorGetProfileDataState(this.message);
}
