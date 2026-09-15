import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:hive_flutter/adapters.dart';

abstract class SettingsLocalDataSource {
  List<PassangerModel> get();
}

class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  @override
  List<PassangerModel> get() {
    var box = Hive.box<PassangerModel>(passengerBox);
    List<PassangerModel> passengers = box.values.toList();
    return passengers;
  }
}
